-- Verify if DWg2ssid database exists, create the database if it does not exists
IF  NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DWg2ssid')
  BEGIN
	CREATE DATABASE DWg2ssid;
	PRINT 'Database DWg2ssid created.';
  END
GO

USE [DWg2ssid];
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ETL')
BEGIN
	EXEC('CREATE SCHEMA [ETL]')
	PRINT 'ETL Schema created.';
END

-- Verify if the Dimension tables exists, drop the tables if they exists

IF OBJECT_ID('dbo.FactAccidents') IS NOT NULL
  BEGIN
	DROP TABLE dbo.FactAccidents;
	PRINT 'dbo.FactAccidents table deleted.'
  END
IF OBJECT_ID('dbo.FactEquipmentAssignment') IS NOT NULL
  BEGIN
	DROP TABLE dbo.FactEquipmentAssignment;
	PRINT 'dbo.FactEquipmentAssignment table deleted.'
  END
IF OBJECT_ID('dbo.FactEquipmentIncomplete') IS NOT NULL
  BEGIN
	DROP TABLE dbo.FactEquipmentIncomplete;
	PRINT 'dbo.FactEquipmentIncomplete table deleted.'
  END
IF OBJECT_ID('dbo.DimEmployee') IS NOT NULL
  BEGIN
	DROP TABLE dbo.DimEmployee;
	PRINT 'dbo.DimEmployee table deleted.'
  END
IF OBJECT_ID('dbo.DimAccident') IS NOT NULL
  BEGIN
	DROP TABLE dbo.DimAccident;
	PRINT 'dbo.DimAccident table deleted.'
  END
IF OBJECT_ID('dbo.DimEquipment') IS NOT NULL
  BEGIN
	DROP TABLE dbo.DimEquipment;
	PRINT 'dbo.DimEquipment table deleted.'
  END
IF OBJECT_ID('dbo.DimEquipmentCategory') IS NOT NULL
  BEGIN
	DROP TABLE dbo.DimEquipmentCategory;
	PRINT 'dbo.DimEquipmentCategory table deleted.'
  END
IF OBJECT_ID('dbo.DimEquipmentControlDaily') IS NOT NULL
  BEGIN
	DROP TABLE dbo.DimEquipmentControlDaily;
	PRINT 'dbo.DimEquipmentControlDaily table deleted.'
  END
IF OBJECT_ID('dbo.DimProject') IS NOT NULL
  BEGIN
	DROP TABLE dbo.DimProject;
	PRINT 'dbo.DimProject table deleted.'
  END
IF OBJECT_ID('dbo.DimDepartment') IS NOT NULL
  BEGIN
	DROP TABLE dbo.DimDepartment;
	PRINT 'dbo.DimDepartment table deleted.'
  END


/*********************************
** Create Dimensional Tables
**********************************/

-- Create Dimensional table for Employee
CREATE TABLE [dbo].[DimEmployee](
	[ID] [int] NOT NULL,
	[CI] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[Gender] [varchar](8) NULL,
	[Address] [varchar](255) NULL,
	[PhoneNumber] [int] NULL,
 CONSTRAINT [PK_Dimemployee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'dbo.DimEmployee table successfully created.'

-- Create Dimensional table for Accident
CREATE TABLE [dbo].[DimAccident](
	[ID] [int] NOT NULL,
	[Cause] [varchar](255) NOT NULL,
	[DateInit] [datetime] NOT NULL,
	[DayDebited] [varchar](255) NOT NULL,
	[DayLost] [varchar](255) NOT NULL,
	[StartLostTime] [datetime] NOT NULL,
	[EndLostTime] [datetime] NOT NULL,
	[AccidentType] [varchar](15) NULL,
	[Body] [varchar](15) NULL,
	[Assgined] [varchar](15) NULL,
	[Factor] [varchar](15) NULL,
	[Frecuency] [varchar](8) NULL,
	[Kind] [varchar](15) NULL,
	[Medication] [varchar](8) NULL,
	[Receive] [varchar](15) NULL,
	[Severity] [varchar](15) NULL,
	[Turn] [varchar](15) NULL,
	[Way] [varchar](15) NULL,
 CONSTRAINT [PK_DimAccident] PRIMARY KEY CLUSTERED
 (
	[ID] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'dbo.DimAccident table successfully created.'

-- Create Dimensional table for Equipment
CREATE TABLE [dbo].[DimEquipment](
	[ID] [int] NOT NULL,
	[Code] [varchar](255) NULL,
	[AcquisitionDate] [datetime] NULL,
	[Available] [bit] NULL,
	[state] [varchar](255) NULL,
 CONSTRAINT [PK_DimEquipment] PRIMARY KEY CLUSTERED
 (
	[ID] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'dbo.DimEquipment table successfully created.'


-- Create Dimensional table for EquipmentCategory
CREATE TABLE [dbo].[DimEquipmentCategory](
	[ID] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[EquipmentType] [varchar](15) NULL,
	[Description] [varchar](255) NULL
 CONSTRAINT [PK_DimEquipmentCategory] PRIMARY KEY CLUSTERED
 (
	[ID] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'dbo.DimEquipmentCategory table successfully created.'


-- Create Dimensional table for EquipmentControlDaily
CREATE TABLE [dbo].[DimEquipmentControlDaily](
	[ID] [int] NOT NULL,
	[CompleteEquipments] [bit] NOT NULL,
	[DateDay] [datetime] NOT NULL
 CONSTRAINT [PK_DimEquipmentControlDaily] PRIMARY KEY CLUSTERED
 (
	[ID] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'dbo.DimEquipmentControlDaily table successfully created.'


-- Create Dimensional table for Project
CREATE TABLE [dbo].[DimProject](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Place] [varchar](255) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Status] [varchar](16) NULL,
 CONSTRAINT [PK_DimProject] PRIMARY KEY CLUSTERED
 (
	[ID] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'dbo.DimProject table successfully created.'

-- Create Dimensional table for Department
CREATE TABLE [dbo].[DimDepartment](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](255) NOT NULL
 CONSTRAINT [PK_DimDepartment] PRIMARY KEY CLUSTERED
 (
	[ID] ASC
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
PRINT 'dbo.DimDepartment table successfully created.'


/*********************************
** Create Fact Tables
**********************************/

-- Create Fact table for Accidents
CREATE TABLE [dbo].[FactAccidents](
	[EmployeeID] [int] NOT NULL,
	[AccidentID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[DepartmentID] [int] NOt NULL,
	[AccidentCount] [int] NULL,
	[AccidentMonth] [datetime] NULL,
 CONSTRAINT [PK_FactAccidents] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[AccidentID] ASC,
	[ProjectID] ASC,
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
PRINT 'dbo.FactAccidents table successfully created.'

-- Create Fact table for Equipment Assignment
CREATE TABLE [dbo].[FactEquipmentAssignment](
	[EmployeeID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[EquipmentCategoryID] [int] NOT NULL,
	[InitDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Active] [bit] NOT NULL
 CONSTRAINT [PK_FactEquipmentAssignment] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[EquipmentID] ASC,
	[EquipmentCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
PRINT 'dbo.FactEquipmentAssignment table successfully created.'


-- Create Fact table for Equipment Incomplete
CREATE TABLE [dbo].[FactEquipmentIncomplete](
	[EmployeeID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[EquipmentCategoryID] [int] NOT NULL,
	[EquipmentControlDailyID] [int] NOT NULL,
	[RegisterDate] [datetime] NULL
 CONSTRAINT [PK_FactEquipmentIncomplete] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[EquipmentID] ASC,
	[EquipmentCategoryID] ASC,
	[EquipmentControlDailyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
PRINT 'dbo.FactEquipmentIncomplete table successfully created.'


/*********************************
** Create ETL Tables
**********************************/

-- Verify if the Dimension tables exists, drop the tables if they exists

IF OBJECT_ID('ETL.Accidents') IS NOT NULL
  BEGIN
	DROP TABLE ETL.Accidents;
	PRINT 'ETL.Accidents table deleted.'
  END
IF OBJECT_ID('ETL.EquipmentAssignment') IS NOT NULL
  BEGIN
	DROP TABLE ETL.EquipmentAssignment;
	PRINT 'ETL.EquipmentAssignment table deleted.'
  END
IF OBJECT_ID('ETL.EquipmentIncomplete') IS NOT NULL
  BEGIN
	DROP TABLE ETL.EquipmentIncomplete;
	PRINT 'ETL.EquipmentIncomplete table deleted.'
  END
IF OBJECT_ID('ETL.Employee') IS NOT NULL
  BEGIN
	DROP TABLE ETL.Employee;
	PRINT 'ETL.Employee table deleted.'
  END
IF OBJECT_ID('ETL.Accident') IS NOT NULL
  BEGIN
	DROP TABLE ETL.Accident;
	PRINT 'ETL.Accident table deleted.'
  END
IF OBJECT_ID('ETL.Equipment') IS NOT NULL
  BEGIN
	DROP TABLE ETL.Equipment;
	PRINT 'ETL.Equipment table deleted.'
  END
IF OBJECT_ID('ETL.EquipmentCategory') IS NOT NULL
  BEGIN
	DROP TABLE ETL.EquipmentCategory;
	PRINT 'ETL.EquipmentCategory table deleted.'
  END
IF OBJECT_ID('ETL.EquipmentControlDaily') IS NOT NULL
  BEGIN
	DROP TABLE ETL.EquipmentControlDaily;
	PRINT 'ETL.EquipmentControlDaily table deleted.'
  END
IF OBJECT_ID('ETL.Project') IS NOT NULL
  BEGIN
	DROP TABLE ETL.Project;
	PRINT 'ETL.Project table deleted.'
  END
IF OBJECT_ID('ETL.Department') IS NOT NULL
  BEGIN
	DROP TABLE ETL.Department;
	PRINT 'ETL.Department table deleted.'
  END

-- Create ETL.Employee table
CREATE TABLE [ETL].[Employee](
	[ID] [int] NOT NULL,
	[CI] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[Gender] [varchar](8) NULL,
	[Address] [varchar](255) NULL,
	[PhoneNumber] [int] NULL
) ON [PRIMARY]
GO
PRINT 'ETL.Employee table successfully created.'

-- Create ETL.Accident table
CREATE TABLE [ETL].[Accident](
	[ID] [int] NOT NULL,
	[Cause] [varchar](255) NOT NULL,
	[DateInit] [datetime] NOT NULL,
	[DayDebited] [varchar](255) NOT NULL,
	[DayLost] [varchar](255) NOT NULL,
	[StartLostTime] [datetime] NOT NULL,
	[EndLostTime] [datetime] NOT NULL,
	[AccidentType] [varchar](15) NULL,
	[Body] [varchar](15) NULL,
	[Assgined] [varchar](15) NULL,
	[Factor] [varchar](15) NULL,
	[Frecuency] [varchar](8) NULL,
	[Kind] [varchar](15) NULL,
	[Medication] [varchar](8) NULL,
	[Receive] [varchar](15) NULL,
	[Severity] [varchar](15) NULL,
	[Turn] [varchar](15) NULL,
	[Way] [varchar](15) NULL
) ON [PRIMARY]

GO
PRINT 'ETL.Accident table successfully created.'

-- Create ETL.Equipment table
CREATE TABLE [ETL].[Equipment](
	[ID] [int] NOT NULL,
	[Code] [varchar](255) NULL,
	[AcquisitionDate] [datetime] NULL,
	[Available] [bit] NULL,
	[state] [varchar](255) NULL
) ON [PRIMARY]

GO
PRINT 'ETL.Equipment table successfully created.'


-- Create ETL.EquipmentCategory table
CREATE TABLE [ETL].[EquipmentCategory](
	[ID] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[EquipmentType] [varchar](15) NULL,
	[Description] [varchar](255) NULL
) ON [PRIMARY]

GO
PRINT 'ETL.EquipmentCategory table successfully created.'


-- Create ETL.EquipmentControlDaily table
CREATE TABLE [ETL].[EquipmentControlDaily](
	[ID] [int] NOT NULL,
	[CompleteEquipments] [bit] NOT NULL,
	[DateDay] [datetime] NOT NULL
) ON [PRIMARY]

GO
PRINT 'ETL.EquipmentControlDaily table successfully created.'


-- Create ETL.Project table
CREATE TABLE [ETL].[Project](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Place] [varchar](255) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Status] [varchar](16) NULL
) ON [PRIMARY]

GO
PRINT 'ETL.Project table successfully created.'

-- Create ETL.Department table
CREATE TABLE [ETL].[Department](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
PRINT 'ETL.Department table successfully created.'

-- Create ETL.Accidents table
CREATE TABLE [ETL].[Accidents](
	[EmployeeID] [int] NOT NULL,
	[AccidentID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[AccidentCount] [int] NULL,
	[AccidentMonth] [datetime] NULL
) ON [PRIMARY]
GO
PRINT 'ETL.Accidents table successfully created.'

-- Create ETL.EquipmentAssignment table
CREATE TABLE [ETL].[EquipmentAssignment](
	[EmployeeID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[EquipmentCategoryID] [int] NOT NULL,
	[InitDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
PRINT 'ETL.EquipmentAssignment table successfully created.'

-- Create ETL.EquipmentIncomplete table
CREATE TABLE [ETL].[EquipmentIncomplete](
	[EmployeeID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[EquipmentCategoryID] [int] NOT NULL,
	[EquipmentControlDailyID] [int] NOT NULL,
	[RegisterDate] [datetime] NULL
) ON [PRIMARY]
GO
PRINT 'ETL.EquipmentIncomplete table successfully created.'


-- Add Foreign Keys for [FactAccidents] Table
ALTER TABLE [dbo].[FactAccidents]  WITH CHECK ADD  CONSTRAINT [FK_FactAccident_DimEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[DimEmployee] ([ID])
GO
ALTER TABLE [dbo].[FactAccidents] CHECK CONSTRAINT [FK_FactAccident_DimEmployee]
GO
ALTER TABLE [dbo].[FactAccidents]  WITH CHECK ADD  CONSTRAINT [FK_FactAccident_DimAccident] FOREIGN KEY([AccidentID])
REFERENCES [dbo].[DimAccident] ([ID])
GO
ALTER TABLE [dbo].[FactAccidents] CHECK CONSTRAINT [FK_FactAccident_DimAccident]
GO
ALTER TABLE [dbo].[FactAccidents]  WITH CHECK ADD  CONSTRAINT [FK_FactAccident_DimProject] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[DimProject] ([ID])
GO
ALTER TABLE [dbo].[FactAccidents] CHECK CONSTRAINT [FK_FactAccident_DimProject]
GO
ALTER TABLE [dbo].[FactAccidents]  WITH CHECK ADD  CONSTRAINT [FK_FactAccident_DimDepartment] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DimDepartment] ([ID])
GO
ALTER TABLE [dbo].[FactAccidents] CHECK CONSTRAINT [FK_FactAccident_DimDepartment]
GO

-- Add Foreign Keys for [FactEquipmentAssignment] Table
ALTER TABLE [dbo].[FactEquipmentAssignment]  WITH CHECK ADD  CONSTRAINT [FK_FactEquipmentAssignment_DimEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[DimEmployee] ([ID])
GO
ALTER TABLE [dbo].[FactEquipmentAssignment] CHECK CONSTRAINT [FK_FactEquipmentAssignment_DimEmployee]
GO
ALTER TABLE [dbo].[FactEquipmentAssignment]  WITH CHECK ADD  CONSTRAINT [FK_FactEquipmentAssignment_DimEquipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[DimEquipment] ([ID])
GO
ALTER TABLE [dbo].[FactEquipmentAssignment] CHECK CONSTRAINT [FK_FactEquipmentAssignment_DimEquipment]
GO
ALTER TABLE [dbo].[FactEquipmentAssignment]  WITH CHECK ADD  CONSTRAINT [FK_FactEquipmentAssignment_DimEquipmentCategory] FOREIGN KEY([EquipmentCategoryID])
REFERENCES [dbo].[DimEquipmentCategory] ([ID])
GO
ALTER TABLE [dbo].[FactEquipmentAssignment] CHECK CONSTRAINT [FK_FactEquipmentAssignment_DimEquipmentCategory]
GO


-- Add Foreign Keys for [[FactEquipmentIncomplete]] Table
ALTER TABLE [dbo].[FactEquipmentIncomplete]  WITH CHECK ADD  CONSTRAINT [FK_FactEquipmentIncomplete_DimEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[DimEmployee] ([ID])
GO
ALTER TABLE [dbo].[FactEquipmentIncomplete] CHECK CONSTRAINT [FK_FactEquipmentIncomplete_DimEmployee]
GO
ALTER TABLE [dbo].[FactEquipmentIncomplete]  WITH CHECK ADD  CONSTRAINT [FK_FactEquipmentIncomplete_DimEquipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[DimEquipment] ([ID])
GO
ALTER TABLE [dbo].[FactEquipmentIncomplete] CHECK CONSTRAINT [FK_FactEquipmentIncomplete_DimEquipment]
GO
ALTER TABLE [dbo].[FactEquipmentIncomplete]  WITH CHECK ADD  CONSTRAINT [FK_FactEquipmentIncomplete_DimEquipmentCategory] FOREIGN KEY([EquipmentCategoryID])
REFERENCES [dbo].[DimEquipmentCategory] ([ID])
GO
ALTER TABLE [dbo].[FactEquipmentIncomplete] CHECK CONSTRAINT [FK_FactEquipmentIncomplete_DimEquipmentCategory]
GO
ALTER TABLE [dbo].[FactEquipmentIncomplete]  WITH CHECK ADD  CONSTRAINT [FK_FactEquipmentIncomplete_DimEquipmentControlDaily] FOREIGN KEY([EquipmentControlDailyID])
REFERENCES [dbo].[DimEquipmentControlDaily] ([ID])
GO
ALTER TABLE [dbo].[FactEquipmentIncomplete] CHECK CONSTRAINT [FK_FactEquipmentIncomplete_DimEquipmentControlDaily]
GO


/******************************************************************************
**  Name: ETL.DW_MergeProjects
**  Desc: Merges Source ETL.Projects changes into Destination dbo.DimProjects table. 
**  Called By SQL Job ETL
**
**  Author: Julio Cesar Quispe
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 18/05/2018  Julio Cesar Quispe   Initial Version
******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'DW_MergeProject')
	DROP PROCEDURE [ETL].[DW_MergeProject]
GO
CREATE PROCEDURE [ETL].[DW_MergeProject]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimProject] AS target
	USING [ETL].[Project] AS source
	ON
	(
	  target.[id] = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [name]   = source.[name]
			,[place] = ISNULL(source.[place],'N/A')
			,[description] = ISNULL(source.[description],'N/A')
			,[status]      = source.[status]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[ID]
		,[name]
		,[place]
		,[description]
		,[status]
	  )
	  VALUES
	  (
		source.[ID]
		,source.[name]
		,source.[place]
		,source.[description]
		,source.[status]
	  );
END
GO


/******************************************************************************
**  Name: ETL.DW_MergeProjects
**  Desc: Merges Source ETL.Projects changes into Destination dbo.DimProjects table. 
**  Called By SQL Job ETL
**
**  Author: Julio Cesar Quispe
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 18/05/2018  Julio Cesar Quispe   Initial Version
******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'DW_MergeDepartment')
	DROP PROCEDURE [ETL].[DW_MergeDepartment]
GO
CREATE PROCEDURE [ETL].[DW_MergeDepartment]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimDepartment] AS target
	USING [ETL].[Department] AS source
	ON
	(
	  target.[id] = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [name]   = source.[name]
			,[description] = ISNULL(source.[description],'N/A')
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[ID]
		,[name]
		,[description]
	  )
	  VALUES
	  (
		source.[ID]
		,source.[name]
		,source.[description]
	  );
END
GO

/******************************************************************************
**  Name: ETL.DW_MergeEmployees
**  Desc: Merges Source ETL.Projects changes into Destination dbo.DimEmployee table. 
**  Called By SQL Job ETL
**
**  Author: Julio Cesar Quispe
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 18/05/2018  Julio Cesar Quispe   Initial Version
******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'DW_MergeEmployee')
	DROP PROCEDURE [ETL].[DW_MergeEmployee]
GO
CREATE PROCEDURE [ETL].[DW_MergeEmployee]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimEmployee] AS target
	USING [ETL].[Employee] AS source
	ON
	(
	  target.[id] = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [ci]   = source.[ci]
			,[firstName]   = source.[firstName]
			,[lastName] = source.[lastName]
			,[birthDate] = source.[birthDate]
			,[gender] = source.[gender]
			,[address] = source.[address]
			,[phoneNumber] = source.[phoneNumber]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[ID]
		,[ci]
		,[firstName]
		,[lastName]
		,[birthDate]
		,[gender]
		,[address]
		,[phoneNumber]
	  )
	  VALUES
	  (
		source.[ID]
		,source.[ci]
		,source.[firstName]
		,source.[lastName]
		,source.[birthDate]
		,source.[gender]
		,source.[address]
		,source.[phoneNumber]
	  );
END
GO

/******************************************************************************
**  Name: ETL.DW_MergeAccident
**  Desc: Merges Source ETL.Accident changes into Destination dbo.DimAccident table. 
**  Called By SQL Job ETL
**
**  Author: Julio Cesar Quispe
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 18/05/2018  Julio Cesar Quispe   Initial Version
******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'DW_MergeAccident')
	DROP PROCEDURE [ETL].[DW_MergeAccident]
GO
CREATE PROCEDURE [ETL].[DW_MergeAccident]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimAccident] AS target
	USING [ETL].[Accident] AS source
	ON
	(
	  target.[id] = source.[id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [cause]   = source.[cause]
			,[DateInit]   = source.[DateInit]
			,[DayDebited] = source.[DayDebited]
			,[DayLost] = source.[DayLost]
			,[StartLostTime] = source.[StartLostTime]
			,[EndLostTime] = source.[EndLostTime]
			,[AccidentType] = source.[AccidentType]
			,[Body] = source.[Body]
			,[Assgined] = source.[Assgined]
			,[Factor] = source.[Factor]
			,[Frecuency] = source.[Frecuency]
			,[Kind] = source.[Kind]
			,[Medication] = source.[Medication]
			,[Receive] = source.[Receive]
			,[Severity] = source.[Severity]
			,[Turn] = source.[Turn]
			,[Way] = source.[Way]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[ID]
		,[cause]   
		,[DateInit]   
		,[DayDebited] 
		,[DayLost] 
		,[StartLostTime] 
		,[EndLostTime] 
		,[AccidentType] 
		,[Body] 
		,[assgined] 
		,[Factor] 
		,[Frecuency] 
		,[Kind] 
		,[Medication] 
		,[Receive] 
		,[Severity] 
		,[Turn] 
		,[Way] 
	  )
	  VALUES
	  (
		source.[ID]
		,source.[cause]
		,source.[DateInit]
		,source.[DayDebited]
		,source.[DayLost]
		,source.[StartLostTime]
		,source.[EndLostTime]
		,source.[AccidentType]
		,source.[Body]
		,source.[Assgined]
		,source.[Factor]
		,source.[Frecuency]
		,source.[Kind]
		,source.[Medication]
		,source.[Receive]
		,source.[Severity]
		,source.[Turn]
		,source.[Way]
	  );
END
GO


/******************************************************************************
**  Name: ETL.DW_MergeEmployees
**  Desc: Merges Source ETL.Projects changes into Destination dbo.DimEmployee table. 
**  Called By SQL Job ETL
**
**  Author: Julio Cesar Quispe
**
**  Created: 18/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 18/05/2018  Julio Cesar Quispe   Initial Version
******************************************************************************/

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'DW_MergeAccidents')
	DROP PROCEDURE [ETL].[DW_MergeAccidents]
GO
CREATE PROCEDURE [ETL].[DW_MergeAccidents]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[FactAccidents] AS target
	USING [ETL].[Accidents] AS source
	ON
	(
	  target.[employeeId] = source.[employeeId]
	  AND target.[accidentId]     = source.[accidentId]
	  AND target.[projectId] = source.[projectId]
	  AND target.[departmentID]    = source.[departmentID]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [employeeId]   = source.[employeeId]
			,[accidentId]   = source.[accidentId]
			,[projectId] = source.[projectId]
			,[DepartmentId] = source.[DepartmentId]
			,[accidentCount] = source.[accidentCount]
			,[accidentMonth] = source.[accidentMonth]
			
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[employeeId]
		,[accidentId]
		,[projectId]
		,[DepartmentId]
		,[accidentCount]
		,[accidentMonth]
	  )
	  VALUES
	  (
		source.[employeeId]
		,source.[accidentId]
		,source.[projectId]
		,source.[DepartmentId]
		,source.[accidentCount]
		,source.[accidentMonth]
	  );
END
GO

