USE g2ssid;
go

IF NOT EXISTS ( SELECT  *
                FROM    sys.schemas
                WHERE   name = N'ETL' ) 
    EXEC('CREATE SCHEMA [ETL]');
GO

/******************************************************************************
**  Name: Create Table TableMigration
**  Desc: Table TableMigration
**
**  Author: Julio Quispe
**
**  Created: 07/04/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:         Description:
**  --------    --------        -----------------------------------------------
**  18/05/2018  Julio Quispe Initial Version
******************************************************************************/
IF OBJECT_ID('ETL.TableMigration', 'U') IS NOT NULL
	drop table ETL.[TableMigration];

CREATE TABLE [ETL].[TableMigration](
	[IDMigration] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[LatestChange] [bigint] NOT NULL CONSTRAINT [DF_Migration]  DEFAULT ((0)),
 CONSTRAINT [PK_Migration] PRIMARY KEY CLUSTERED 
(
	[IDMigration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'ETL.TableMigration table successfully created.'

/******************************************************************************
**  Name: GetDatabaseRowVersion
**  Desc: Used by DW ETL Process
**
**  Called by: SQL Job
**  Author: Julio Quispe
**
**  Created: 02/07/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:         Description:
**  --------    --------        -----------------------------------------------
**  18/05/2018  Julio Quispe Initial Version
******************************************************************************/
IF EXISTS (SELECT * FROM   sys.objects WHERE  object_id = OBJECT_ID(N'[ETL].[GetDatabaseRowVersion]') AND type IN ( N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
    DROP FUNCTION [ETL].[GetDatabaseRowVersion];
END
GO

CREATE FUNCTION [ETL].[GetDatabaseRowVersion] ()
RETURNS BIGINT
AS
BEGIN
  RETURN CONVERT(BIGINT, MIN_ACTIVE_ROWVERSION()) - 1;
END
GO
PRINT 'Procedure [ETL].[GetDatabaseRowVersion] created';

/******************************************************************************
**  Name: GetTableMigrationLatestRowVersion
**  Desc: Gets Latest Rowversion used into the corresponding the table
**
**  Called by: SQL Job
**  Author: Julio Quispe
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:         Description:
**  --------    --------        -----------------------------------------------
**  18/05/2018 Julio Quispe  Initial Version
******************************************************************************/
IF EXISTS (SELECT * FROM   sys.objects WHERE  object_id = OBJECT_ID(N'[ETL].[GetTableMigrationLatestRowVersion]') AND type IN ( N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
    DROP FUNCTION [ETL].[GetTableMigrationLatestRowVersion];
END
GO
CREATE FUNCTION [ETL].[GetTableMigrationLatestRowVersion] 
(
	@table VARCHAR(50)
)
RETURNS BIGINT
AS
BEGIN
	DECLARE @last BIGINT = 0;

	SELECT @last = ISNULL(LatestChange, 0 )
	FROM [ETL].[TableMigration]
	WHERE TableName = @table;

  RETURN @last;
END
GO
PRINT 'Procedure [ETL].[GetTableMigrationLatestRowVersion]  created';
GO
/******************************************************************************
**  Name: UpdateTableMigration
**  Desc: Updates Table Migration with latest Rowversion used 
**  Called By ETL SQL Job.
**
**  Author: Julio Cesar Quispe
**
**  Created: 18/05/2018
*******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'UpdateTableMigration')
	DROP PROCEDURE [ETL].[UpdateTableMigration];
GO
CREATE PROCEDURE [ETL].[UpdateTableMigration]
(
  @tableName VARCHAR(50),
  @current     BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	UPDATE [ETL].[TableMigration]
	SET LatestChange = @current
	WHERE TableName = @tableName;
GO
PRINT 'Procedure [ETL].[UpdateTableMigration]  created';
GO
/******************************************************************************
**  Name: PullTableDataToDW
**  Desc: Pulls Changes and Inserts from the g2ssid Database
**  Called By ETL SQL Job.
**
**  Author: Julio Cesar Quispe
**
**  Created: 18/05/2018
********************************************************************************/
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'PullDataToDatawarehouse')
	DROP PROCEDURE [ETL].[PullDataToDatawarehouse];
GO

CREATE PROCEDURE [ETL].[PullDataToDatawarehouse]
(
  @table VARCHAR(50)
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
BEGIN
	DECLARE @SQLString      NVARCHAR(MAX);  
	DECLARE @ParmDefinition NVARCHAR(MAX); 
	DECLARE @currentDBTS    BIGINT = [ETL].[GetDatabaseRowVersion]();
	DECLARE @lastDBTS       BIGINT = [ETL].[GetTableMigrationLatestRowVersion](@table); 

	SET @ParmDefinition = N'@last BIGINT, @current BIGINT'; 
	SET @SQLString = N'INSERT INTO [DWg2ssid].[ETL].[' + @table + ']
					   EXECUTE [ETL].[Get' + @table + 'ChangesByRowVersion] @LastRowVersionID = @last
																		   ,@CurrentDBTS      = @current;';  
	PRINT @SQLString;
	PRINT @currentDBTS;
	PRINT @lastDBTS;
	EXECUTE SP_EXECUTESQL @SQLString
						 ,@ParmDefinition
						 ,@last    = @lastDBTS
						 ,@current = @currentDBTS;  

	EXECUTE [ETL].[UpdateTableMigration] @tableName = @table
										,@current   = @currentDBTS;
END
PRINT 'Procedure [ETL].[PullDataToDatawarehouse] created';
GO
/******************************************************************************
**  Name: GetProjectChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Project table 
**  Called By ETL SQL Job.
**
**  Author: Julio Quispe Soliz
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  18/05/2018  Julio Quispe
******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[GetProjectChangesByRowVersion]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[GetProjectChangesByRowVersion]
END
GO

CREATE PROCEDURE [ETL].[GetProjectChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT [id]
		  ,[name]
		  ,[place]
		  ,[description]
		  ,[status_project]
	FROM [dbo].[Project]
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO
PRINT 'Procedure [ETL].[GetProjectChangesByRowVersion] created';

/******************************************************************************
**  Name: GetDepartmentChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Department table 
**  Called By ETL SQL Job.
**
**  Author: Julio Quispe Soliz
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  18/05/2018  Julio Quispe
******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[ETL].[GetDepartmentChangesByRowVersion]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [ETL].[GetDepartmentChangesByRowVersion]
END
GO

CREATE PROCEDURE [ETL].[GetDepartmentChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT [id]
		  ,[name]
		  ,[description]
	FROM [dbo].[department]
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO
PRINT 'Procedure [ETL].[GetDepartmentChangesByRowVersion] created';

/******************************************************************************
**  Name: GetEquipmentChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Equipment table 
**  Called By ETL SQL Job.
**
**  Author: Julio Quispe Soliz
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  18/05/2018  Julio Quispe
******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetEquipmentChangesByRowVersion')
	DROP PROCEDURE [ETL].[GetEquipmentChangesByRowVersion];
GO

CREATE PROCEDURE [ETL].[GetEquipmentChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT [id]
		  ,[code]
		  ,[acquisition_date]
		  ,[available]
		  ,[state]
	FROM [dbo].[Equipment]
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO

/******************************************************************************
**  Name: GetEmployeeChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Employee table 
**  Called By ETL SQL Job.
**
**  Author: Julio Quispe Soliz
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  18/05/2018  Julio Quispe
******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetEmployeeChangesByRowVersion')
	DROP PROCEDURE [ETL].[GetEmployeeChangesByRowVersion];
GO

CREATE PROCEDURE [ETL].[GetEmployeeChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT [id]
		  ,[ci]
		  ,[first_name]
		  ,[last_name]
		  ,[birth_date]
		  ,[gender]
		  ,[address]
		  ,[phone_number]
	FROM [dbo].[Employee]
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO


/******************************************************************************
**  Name: GetAccidentFormChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.AccidentForm table 
**  Called By ETL SQL Job.
**
**  Author: Julio Quispe Soliz
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  18/05/2018  Julio Quispe
******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetAccidentChangesByRowVersion')
	DROP PROCEDURE [ETL].[GetAccidentChangesByRowVersion];
GO

CREATE PROCEDURE [ETL].[GetAccidentChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT [id]
		  ,[cause]
		  ,[date_init]
		  ,[day_debited]
		  ,[day_lost]
		  ,[start_lost_time]
		  ,[end_lost_time]
		  ,[accident_type]
		  ,[body]
		  ,[assigned]
		  ,[factor]
		  ,[frecuency]
		  ,[kind]
		  ,[medication]
		  ,[receive]
		  ,[severity]
		  ,[turn]
		  ,[way]
	FROM [dbo].[accident]
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO
PRINT 'Procedure [ETL].[GetAccidentChangesByRowVersion] created';
/******************************************************************************
**  Name: GetAccidentsChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.AccidentForms table 
**  Called By ETL SQL Job.
**
**  Author: Julio Quispe Soliz
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:      Description:
**  --------    --------     --------------------------------------------------
**  18/05/2018  Julio Quispe
******************************************************************************/
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'GetAccidentsChangesByRowVersion')
	DROP PROCEDURE [ETL].[GetAccidentsChangesByRowVersion]
GO

CREATE PROCEDURE [ETL].[GetAccidentsChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT E.id 'employeeId'
		,A.id 'accidentId'
		,P.id 'projectId'
		,DP.department_id 'departmentId'
		,1
		,A.date_init
	FROM [dbo].[accident] A
	INNER JOIN [dbo].employee E on (E.id = A.employee_id)
	INNER JOIN dbo.contract C on (C.employee_id = E.id)
	INNER JOIN dbo.department_position DP on (DP.position_id = C.position_id)
	INNER JOIN dbo.project P on (P.id = C.project_id)
	WHERE A.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND A.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO





