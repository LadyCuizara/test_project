/********************************************************************************************************
******************* Sistema de Seguridad Industrial - grupo D - turno tarde *****************************
**  BD  : g2ssid -- Sql Server 2014
**  Author: Lady Laura Cuizara Porco
**
*********************************************************************************************************/
use g2ssid
go

----------------------------------------------------------------------------------------------------------
-- CREATE STORE PROCEDURE INSERT PROJECT
----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE INSERT PROJECT....';

IF OBJECT_ID('SP_InsertProject', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertProject
go

CREATE PROCEDURE SP_InsertProject
	@cre_by AS varchar(20),
    @des AS VARCHAR(255),
    @nam AS VARCHAR(255),
	@pla AS VARCHAR(255),
    @est As VARCHAR(15),
	--@a   As datetime OUTPUT,
    @msg AS VARCHAR(100) OUTPUT,
    @id int OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        INSERT INTO [dbo].[project] (created_at,created_by,description, name, place,status_project)
		VALUES (SYSDATETIME(),@cre_by, @des,@nam, @pla, @est)

		SELECT @id = SCOPE_IDENTITY()
		SET @msg = 'El projecto se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
----------------------------------------------------------------------------------------------------------
-- CREATE STORE PROCEDURE INSERT DEPATMENT
----------------------------------------------------------------------------------------------------------
PRINT 'CREATING STORE PROCEDURE INSERT DEPATMENT....';

IF OBJECT_ID('SP_InsertDepartment', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertDepartment
go

CREATE PROCEDURE SP_InsertDepartment
    --@cre_at AS datetime,
	@cre_by AS varchar(20),
	@desc AS VARCHAR(255),
    @nam AS VARCHAR(255),
    @msg AS VARCHAR(100) OUTPUT,
    @id int OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try
		INSERT INTO [dbo].[department] (created_at,created_by,description,name)
		VALUES (SYSDATETIME(),@cre_by, @desc,@nam)

		SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El Departamento se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
----------------------------------------------------------------------------------------------------------
-- CREATE STORE PROCEDURE INSERT EMPLOYEE
----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE INSERT EMPLOYEE....';

IF OBJECT_ID('SP_InsertEmployee', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertEmployee
go

CREATE PROCEDURE SP_InsertEmployee
    --@cre_at AS datetime,
	@cre_by AS varchar(20),
	@fnam AS VARCHAR(255),
	@lnam AS VARCHAR(255),
	@ci AS int,
	@birt AS datetime,
	@emai AS VARCHAR(255),
	@addr AS VARCHAR(255),
    @gend AS VARCHAR(15),
	@phon AS int,
	--@a   As datetime OUTPUT,
    @msg AS VARCHAR(100) OUTPUT,
    @id int OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        INSERT INTO [dbo].[employee] (created_at,created_by,first_name,last_name, ci,birth_date,email,address,gender,phone_number)
		VALUES (SYSDATETIME(),@cre_by, @fnam,@lnam,@ci, @birt,@emai,@addr,@gend, @phon)
		--select @a = scope_identity();

		SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El empleado se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
----------------------------------------------------------------------------------------------------------
-- CREATE STORE PROCEDURE INSERT EQUIPMENT_CATEGORY
----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE INSERT EQUIPMENT_CATEGORY....';

IF OBJECT_ID('SP_InsertEquipmentCategory', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertEquipmentCategory
go

CREATE PROCEDURE SP_InsertEquipmentCategory
    --@cre_at AS datetime,
	@cre_by AS varchar(20),
	@desc AS VARCHAR(255),
	@eqType AS VARCHAR(15),
	@imag AS VARCHAR(255),
	@nam AS VARCHAR(255),
    @msg AS VARCHAR(100) OUTPUT,
	@id int OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        INSERT INTO [dbo].[equipment_category] (created_at, created_by,description,equipment_type,image_path,name)
		VALUES (SYSDATETIME(),@cre_by, @desc,@eqType,@imag,@nam)
		SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'La categoria se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
----------------------------------------------------------------------------------------------------------
-- CREATE STORE PROCEDURE INSERT EQUIPMENT
----------------------------------------------------------------------------------------------------------
PRINT 'CREATING STORE PROCEDURE INSERT EQUIPMENT....';

IF OBJECT_ID('SP_InsertEquipment', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertEquipment
go

CREATE PROCEDURE SP_InsertEquipment
    --@cre_at AS datetime,
	@cre_by AS varchar(20),
	@acDate AS datetime,
	@avai   AS bit,
	@code AS VARCHAR(255),
	@stat AS VARCHAR(255),
	@catID AS int,
    @msg AS VARCHAR(100) OUTPUT,
	@id int OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        INSERT INTO [dbo].[equipment] (created_at,created_by,acquisition_date,available,code,state,category_id)
		VALUES (SYSDATETIME(),@cre_by, @acDate,@avai,@code,@stat,@catID)
		SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El equipo se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
----------------------------------------------------------------------------------------------------------
-- CREATE STORE PROCEDURE INSERT EQUIPMENT ASSIGNMENT
----------------------------------------------------------------------------------------------------------
PRINT 'CREATING STORE PROCEDURE INSERT EQUIPMENT ASSIGNMENT....';

IF OBJECT_ID('SP_InsertEquipmentAssignment', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertEquipmentAssignment
go

CREATE PROCEDURE SP_InsertEquipmentAssignment
    --@cre_at AS datetime,
	@cre_by AS varchar(20),
	@acti AS bit,
	@emplID AS int,
	@equiID AS int,
    @msg AS VARCHAR(100) OUTPUT,
	@id int OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        INSERT INTO [dbo].[equipment_assignment] (created_at,created_by,active,init_date,employee_id,equipment_id)
		VALUES (SYSDATETIME(),@cre_by, 1,SYSDATETIME(),@emplID,@equiID)
		SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El equipo fue assignado correctamente correctamente al empleado. con id: '+ @emplID;

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
----------------------------------------------------------------------------------------------------------
-- CREATE STORE PROCEDURE INSERT POSITION
----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE INSERT POSITION...';

IF OBJECT_ID('SP_InsertPosition', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertPosition
go

CREATE PROCEDURE SP_InsertPosition
    --@cre_at AS datetime,
	@cre_by AS varchar(20),
	@desc AS varchar(255),
	@nam AS varchar(255),
    @msg AS VARCHAR(100) OUTPUT,
	@id int OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        INSERT INTO [dbo].[position] (created_at,created_by,description,name)
		VALUES (SYSDATETIME(),@cre_by, @desc,@nam)
		SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El cargo fue creado correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO

-- CREATE STORE PROCEDURE INSERT CONTRACT
PRINT 'CREATING STORE PROCEDURE INSERT CONTRACT....';

IF OBJECT_ID('SP_InsertContract', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertContract
go

CREATE PROCEDURE SP_InsertContract
    --@cre_at AS datetime,
    @cre_by AS varchar(20),
    @empType AS varchar(15),
    @iniDate AS datetime,
    @endDate AS datetime,
    @sala AS DECIMAL,
    @empID AS int,
    @posID AS int,
    @projID AS int,
    @msg AS VARCHAR(100) OUTPUT,
    @id int OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        INSERT INTO [dbo].[contract] (created_at,created_by,employee_type,init_date,end_date,salary,employee_id,position_id, project_id)
        VALUES (SYSDATETIME(),@cre_by, @empType,@iniDate,@endDate,@sala,@empID,@posID, @projID)

        SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El cargo fue assignado correctamente correctamente al empleado. con id: '+ CONVERT(nvarchar(100), @empID);

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO


/****************************************************************************************************************************/
/************************************************       PROCEDURE GET ALL      **********************************************/
/****************************************************************************************************************************/

/*------------------------------------------------------------------------------------------
**STORE PROCEDURE Get PROJECT
------------------------------------------------------------------------------------------*/
PRINT 'CREATING STORE PROCEDURE GET PROJECT....';
IF OBJECT_ID('get_all_project', 'P') IS NOT NULL
    DROP PROCEDURE get_all_project
GO

CREATE PROCEDURE get_all_project
AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		SELECT  *
		FROM [dbo].[project]

        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO

/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE get_ EMPLOYEE
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE get_ EMPLOYEE....';
IF OBJECT_ID('get_all_employees', 'P') IS NOT NULL
    DROP PROCEDURE get_all_employees
go

CREATE PROCEDURE get_all_employees
	AS
BEGIN
    SET NOCOUNT ON;
    Begin Try

        SELECT	*
		FROM dbo.employee


    End try
    Begin Catch


    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Get DEPATMENT
*/----------------------------------------------------------------------------------------------------------
PRINT 'CREATING STORE PROCEDURE Get DEPATMENT....';

IF OBJECT_ID('get_all_department', 'P') IS NOT NULL
    DROP PROCEDURE get_all_department
go

CREATE PROCEDURE get_all_department
AS

BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try
		SELECT *
		from [dbo].[department]

        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO

/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Get EQUIPMENT_CATEGORY
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Get EQUIPMENT_CATEGORY....';

IF OBJECT_ID('get_all_equipmentCategory', 'P') IS NOT NULL
    DROP PROCEDURE get_all_equipmentCategory
go

CREATE PROCEDURE get_all_equipmentCategory
    @catID AS int

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		SELECT description,equipment_type,image_path,name
		FROM [dbo].[equipment_category]
		where id = @catID


        COMMIT TRAN Tadd

    End try
    Begin Catch

	Rollback TRAN Tadd

    End Catch

END
GO

/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Get EQUIPMENT
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Get EQUIPMENT....';

IF OBJECT_ID('get_all_equipment', 'P') IS NOT NULL
    DROP PROCEDURE get_all_equipment
go

CREATE PROCEDURE get_all_equipment
AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		SELECT	acquisition_date,available,code	,state,category_id
		FROM [dbo].[equipment]
        COMMIT TRAN Tadd

    End try
    Begin Catch
        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Get EQUIPMENT ASSIGNMENT
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Get EQUIPMENT ASSIGNMENT....';

IF OBJECT_ID('get_all_equipmentAssignment', 'P') IS NOT NULL
    DROP PROCEDURE get_all_equipmentAssignment
go

CREATE PROCEDURE get_all_equipmentAssignment
AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try


		SELECT	active	,init_date,end_date	,employee_id,equipment_id
		FROM [dbo].[equipment_assignment]

        COMMIT TRAN Tadd

    End try
    Begin Catch
        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Get POSITION
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Get POSITION...';

IF OBJECT_ID('get_all_position', 'P') IS NOT NULL
    DROP PROCEDURE get_all_position
go

CREATE PROCEDURE get_all_position

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		SELECT		description		,name
		FROM [dbo].[position]

        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Get  CONTRACT
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Get CONTRACT....';

IF OBJECT_ID('get_all_contract', 'P') IS NOT NULL
    DROP PROCEDURE get_all_contract
go

CREATE PROCEDURE get_all_contract

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try


		SELECT	employee_type,init_date	,end_date,salary	,employee_id,position_id
		FROM [dbo].[contract]

        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO
/****************************************************************************************************************************/
/************************************************     PROCEDURE GET-BY-ID      **********************************************/
/****************************************************************************************************************************/

/*------------------------------------------------------------------------------------------
**STORE PROCEDURE GetByID PROJECT
------------------------------------------------------------------------------------------*/
PRINT 'CREATING STORE PROCEDURE GetByID PROJECT....';
IF OBJECT_ID('SP_get_project', 'P') IS NOT NULL
    DROP PROCEDURE SP_get_project
GO

CREATE PROCEDURE SP_get_project
@id int
AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		SELECT  *
		FROM [dbo].[project]
        where id = @id;
        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO

/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE GetByID_ EMPLOYEE
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE GetByID_ EMPLOYEE....';
IF OBJECT_ID('SP_get_employee', 'P') IS NOT NULL
    DROP PROCEDURE SP_get_employee
go

CREATE PROCEDURE SP_get_employee @id int
	AS
BEGIN
    SET NOCOUNT ON;
    Begin Tran Tadd
    Begin Try

        SELECT	*
		FROM dbo.employee
		where id = @id;
        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE GetByID DEPATMENT
*/----------------------------------------------------------------------------------------------------------
PRINT 'CREATING STORE PROCEDURE GetByID DEPATMENT....';

IF OBJECT_ID('SP_get_department', 'P') IS NOT NULL
    DROP PROCEDURE SP_get_department
go

CREATE PROCEDURE SP_get_department @id int
AS

BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try
		SELECT *
		from [dbo].[department]
        where id = @id;
        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO
--select *from department

/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE GetByID EQUIPMENT_CATEGORY
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE GetByID EQUIPMENT_CATEGORY....';

IF OBJECT_ID('SP_get_equipmentCategory', 'P') IS NOT NULL
    DROP PROCEDURE SP_get_equipmentCategory
go

CREATE PROCEDURE SP_get_equipmentCategory @id int


AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		SELECT *
		FROM [dbo].[equipment_category]
		where id = @id;


        COMMIT TRAN Tadd

    End try
    Begin Catch

	Rollback TRAN Tadd

    End Catch

END
GO

/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE GetByID EQUIPMENT
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE GetByID EQUIPMENT....';

IF OBJECT_ID('SP_get_equipment', 'P') IS NOT NULL
    DROP PROCEDURE SP_get_equipment
go

CREATE PROCEDURE SP_get_equipment @id int
AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		SELECT	*
		FROM [dbo].[equipment]
		where id = @id;
        COMMIT TRAN Tadd

    End try
    Begin Catch
        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE GetByID EQUIPMENT ASSIGNMENT
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE GetByID EQUIPMENT ASSIGNMENT....';

IF OBJECT_ID('SP_get_equipmentAssignment', 'P') IS NOT NULL
    DROP PROCEDURE SP_get_equipmentAssignment
go

CREATE PROCEDURE SP_get_equipmentAssignment @id int
AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try


		SELECT	*
		FROM [dbo].[equipment_assignment]
		where id = @id;
        COMMIT TRAN Tadd

    End try
    Begin Catch
        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE GetByID POSITION
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE GetByID POSITION...';

IF OBJECT_ID('SP_get_position', 'P') IS NOT NULL
    DROP PROCEDURE SP_get_position
go

CREATE PROCEDURE SP_get_position @id int

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		SELECT	*
		FROM [dbo].[position]
		where id = @id;
        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE GetByID  CONTRACT
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE GetByID CONTRACT....';

IF OBJECT_ID('SP_get_contract', 'P') IS NOT NULL
    DROP PROCEDURE SP_get_contract
go

CREATE PROCEDURE SP_get_contract @id int

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try


		SELECT	*
		FROM [dbo].[contract]
		where id = @id;
        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO
------------------------------------------------------------------------------
IF OBJECT_ID('SP_GetContract', 'P') IS NOT NULL
DROP PROCEDURE SP_GetContract
GO

CREATE PROCEDURE SP_GetContract @id int
AS
BEGIN
	Select * From dbo.contract where id = @id;
END
GO

/****************************************************************************************************************************/
/************************************************       PROCEDURE DELETE      **********************************************/
/****************************************************************************************************************************/

/*------------------------------------------------------------------------------------------
**STORE PROCEDURE Delete PROJECT
------------------------------------------------------------------------------------------*/
PRINT 'CREATING STORE PROCEDURE Delete PROJECT....';
IF OBJECT_ID('SP_DeleteProject', 'P') IS NOT NULL
    DROP PROCEDURE SP_DeleteProject
GO

CREATE PROCEDURE SP_DeleteProject

    @id AS int
AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		DELETE
		FROM [dbo].[project]
		WHERE id = @id

        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO


/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Delete EMPLOYEE
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Delete EMPLOYEE....';
IF OBJECT_ID('SP_DeleteEmployee', 'P') IS NOT NULL
    DROP PROCEDURE SP_DeleteEmployee
go

CREATE PROCEDURE SP_DeleteEmployee
    @id as int
	AS
BEGIN
    SET NOCOUNT ON;
    Begin Tran Tadd
    Begin Try

        DELETE
		FROM dbo.employee
		WHERE id = @id
        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Delete DEPATMENT
*/----------------------------------------------------------------------------------------------------------
PRINT 'CREATING STORE PROCEDURE Delete DEPATMENT....';

IF OBJECT_ID('SP_DeleteDepartment', 'P') IS NOT NULL
    DROP PROCEDURE SP_DeleteDepartment
go

CREATE PROCEDURE SP_DeleteDepartment
    @id as int
AS

BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try
		DELETE
		from [dbo].[department]
		WHERE id = @id

        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO

/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Delete EQUIPMENT_CATEGORY
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Delete EQUIPMENT_CATEGORY....';

IF OBJECT_ID('SP_DeleteEquipmentCategory', 'P') IS NOT NULL
    DROP PROCEDURE SP_DeleteEquipmentCategory
go

CREATE PROCEDURE SP_DeleteEquipmentCategory
    @id as int

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		DELETE
		FROM [dbo].[equipment_category]
		WHERE id = @id


        COMMIT TRAN Tadd

    End try
    Begin Catch

	Rollback TRAN Tadd

    End Catch

END
GO

/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Delete EQUIPMENT
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Delete EQUIPMENT....';

IF OBJECT_ID('SP_DeleteEquipment', 'P') IS NOT NULL
    DROP PROCEDURE SP_DeleteEquipment
go

CREATE PROCEDURE SP_DeleteEquipment
    @id as int

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		DELETE
		FROM [dbo].[equipment]
		WHERE id = @id
        COMMIT TRAN Tadd

    End try
    Begin Catch
        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Delete EQUIPMENT ASSIGNMENT
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Delete EQUIPMENT ASSIGNMENT....';

IF OBJECT_ID('SP_DeleteEquipmentAssignment', 'P') IS NOT NULL
    DROP PROCEDURE SP_DeleteEquipmentAssignment
go

CREATE PROCEDURE SP_DeleteEquipmentAssignment
    @id as int

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try


		DELETE
		FROM [dbo].[equipment_assignment]
		WHERE id = @id

        COMMIT TRAN Tadd

    End try
    Begin Catch
        Rollback TRAN Tadd

    End Catch

END
GO
/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Delete POSITION
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Delete POSITION...';

IF OBJECT_ID('SP_DeletePosition', 'P') IS NOT NULL
    DROP PROCEDURE SP_DeletePosition
go

CREATE PROCEDURE SP_DeletePosition
   @id as int

	--@smg as varchar(100)

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

		DELETE
		FROM [dbo].[position]
		WHERE id = @id

        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO

--DECLARE @msg AS VARCHAR(100);
-- [SProcedure_name] @id,@update_by,@first_name,@last_name,@ci,@birth_date,email,address,gender,phone_number
EXEC SP_DeletePosition 2
--SELECT @msg AS msg
--select * from position

/*----------------------------------------------------------------------------------------------------------
* CREATE STORE PROCEDURE Delete  CONTRACT
*/----------------------------------------------------------------------------------------------------------

PRINT 'CREATING STORE PROCEDURE Delete CONTRACT....';

IF OBJECT_ID('SP_DeleteContract', 'P') IS NOT NULL
    DROP PROCEDURE SP_DeleteContract
go

CREATE PROCEDURE SP_DeleteContract
  @id as int

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try


		DELETE
		FROM [dbo].[contract]
		WHERE id = @id

        COMMIT TRAN Tadd

    End try
    Begin Catch

        Rollback TRAN Tadd

    End Catch

END
GO


/****************************************************************************************************************************/
/*==========================================       PROCEDURE UPDATE      ===================================================*/
/**AUTHOR: Lady Laura Cuizara Porco  */
/****************************************************************************************************************************/
/****************************************************************************************************************************/

PRINT 'CREATING STORE PROCEDURE UPDATE PROJECT....';
IF OBJECT_ID('SP_UpdateProject', 'P') IS NOT NULL
    DROP PROCEDURE SP_UpdateProject
GO

CREATE PROCEDURE SP_UpdateProject

    @proyID AS int,
	@upd_by AS varchar(20),
    @des AS VARCHAR(255),
    @nam AS VARCHAR(255),
	@pla AS VARCHAR(255),
    @est As VARCHAR(15),
	--@a   As datetime OUTPUT,
    @msg AS VARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        UPDATE [dbo].[project]
		SET updated_at = SYSDATETIME(),
			updated_by = @upd_by,
			description= @des,
			name	   = @nam,
			place	   = @pla,
			status_project= @est
		WHERE id = @proyID
        SET @msg = 'El projecto se actualizo correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
/*******************************************************************************************
-- CREATE STORE PROCEDURE UPDATE EMPLOYEE
*******************************************************************************************/
PRINT 'CREATING STORE PROCEDURE UPDATE EMPLOYEE....';
IF OBJECT_ID('SP_UpdateEmployee', 'P') IS NOT NULL
    DROP PROCEDURE SP_UpdateEmployee
go

CREATE PROCEDURE SP_UpdateEmployee
    @empID AS int,
	@updBy AS varchar(120),
	@fnam AS VARCHAR(255),
	@lnam AS VARCHAR(255),
	@ci AS int,
	@birt AS datetime,
	@emai AS VARCHAR(255),
	@addr AS VARCHAR(255),
    @gend AS VARCHAR(15),
	@phon AS int,
	--@a   As datetime OUTPUT,
    @msg AS VARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;
    Begin Tran Tadd
    Begin Try

        UPDATE [dbo].[employee]
		set		updated_at	= SYSDATETIME(),
				updated_by	= @updBy,
				first_name	= @fnam,
				last_name	= @lnam,
				ci			= @ci,
				birth_date	= @birt,
				email		= @emai,
				address		= @addr,
				gender		= @gend,
				phone_number= @phon
		WHERE	id = @empID

        SET @msg = 'Los datos del empleado se actualizaron correctamente.';

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
/*******************************************************************************************
-- CREATE STORE PROCEDURE UPDATE DEPATMENT
*******************************************************************************************/
PRINT 'CREATING STORE PROCEDURE UPDATE DEPATMENT....';

IF OBJECT_ID('SP_UpdateDepartment', 'P') IS NOT NULL
    DROP PROCEDURE SP_UpdateDepartment
go

CREATE PROCEDURE SP_UpdateDepartment
    @depID AS int,
	@updBY AS varchar(20),
	@desc AS VARCHAR(255),
    @nam AS VARCHAR(255),
	--@a   As datetime OUTPUT,
    @msg AS VARCHAR(100) OUTPUT

AS

BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try
		update [dbo].[department]
		set updated_at		= SYSDATETIME(),
			updated_by		= @updBY,
			description		= @desc,
			name			= @nam
		where id=@depID
        SET @msg = 'El Departamento con id se actualizo correctamente.' ;

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
/*******************************************************************************************
-- CREATE STORE PROCEDURE UPDATE EQUIPMENT_CATEGORY
*******************************************************************************************/
PRINT 'CREATING STORE PROCEDURE UPDATE EQUIPMENT_CATEGORY....';
IF OBJECT_ID('SP_UpdateEquipmentCategory', 'P') IS NOT NULL
    DROP PROCEDURE SP_UpdateEquipmentCategory
go


CREATE PROCEDURE SP_UpdateEquipmentCategory
    @catID AS int,
	@updBY AS varchar(20),
	@desc AS VARCHAR(255),
	@eqType AS VARCHAR(15),
	@imag AS VARCHAR(255),
	@nam AS VARCHAR(255),
    @msg AS VARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        UPDATE [dbo].[equipment_category]
		SET updated_at		= SYSDATETIME(),
			updated_by		= @updBY,
			description		= @desc,
			equipment_type	= @eqType,
			image_path		= @imag,
			name			= @nam
		where id = @catID
        SET @msg = 'La categoria con id:  se actualizo correctamente.';

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO

/*******************************************************************************************
-- CREATE STORE PROCEDURE UPDATE EQUIPMENT
*******************************************************************************************/
PRINT 'CREATING STORE PROCEDURE UPDATE EQUIPMENT....';

IF OBJECT_ID('SP_UpdateEquipment', 'P') IS NOT NULL
    DROP PROCEDURE SP_UpdateEquipment
go

CREATE PROCEDURE SP_UpdateEquipment
    @EquiID AS int,
	@updBY AS varchar(20),
	@acDate AS datetime,
	@avai   AS bit,
	@code AS VARCHAR(255),
	@stat AS VARCHAR(255),
	@catID AS int,
    @msg AS VARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        UPDATE [dbo].[equipment]
		SET		updated_at		= SYSDATETIME(),
				updated_by		= @updBY,
				acquisition_date= @acDate,
				available		= @avai,
				code			= @code,
				state			= @stat,
				category_id		= @catID
		where		id = @equiID
        SET @msg = 'El equipo se actualizo correctamente. ';

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
/*******************************************************************************************
-- CREATE STORE PROCEDURE UPDATE EQUIPMENT ASSIGNMENT
*******************************************************************************************/
PRINT 'CREATING STORE PROCEDURE UPDATE EQUIPMENT ASSIGNMENT....';

IF OBJECT_ID('SP_UpdateEquipmentAssignment', 'P') IS NOT NULL
    DROP PROCEDURE SP_UpdateEquipmentAssignment
go

CREATE PROCEDURE SP_UpdateEquipmentAssignment
    @eaID AS int,
	@updBY AS varchar(20),
	@acti AS bit,
	@iniDate AS datetime,
	@endDate AS datetime,
	@emplID AS int,
	@equiID AS int,
    @msg AS VARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        Update [dbo].[equipment_assignment]
		set		updated_at		= SYSDATETIME(),
				updated_by		= @updBY,
				active			= @acti,
				init_date		= @iniDate,
				end_date		= @endDate,
				employee_id		= @emplID,
				equipment_id	= @equiID
		where id=@eaID
        SET @msg = 'El assignacion fue actualizada correctamente';

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
/*******************************************************************************************
-- CREATE STORE PROCEDURE UPDATE POSITION
*******************************************************************************************/
PRINT 'CREATING STORE PROCEDURE UPDATE POSITION...';

IF OBJECT_ID('SP_UpdatePosition', 'P') IS NOT NULL
    DROP PROCEDURE SP_UpdatePosition
go

CREATE PROCEDURE SP_UpdatePosition
    @posID AS int,
	@updBY AS varchar(20),
	@desc AS varchar(255),
	@nam AS varchar(255),
    @msg AS VARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;
    Begin Try

        UPDATE [dbo].[position]
		SET		updated_at		= SYSDATETIME(),
				updated_by		= @updBY,
				description		= @desc,
				name			= @nam
		where id = @posID

        SET @msg = 'Los datos del empleado se actualizaron correctamente.';
    End try
    Begin Catch
        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
    End Catch

END
GO
-- CREATE STORE PROCEDURE UPDATE CONTRACT
PRINT 'CREATING STORE PROCEDURE UPDATE CONTRACT....'; 

IF OBJECT_ID('SP_UpdateContract', 'P') IS NOT NULL
    DROP PROCEDURE SP_UpdateContract
go

CREATE PROCEDURE SP_UpdateContract
    @conID AS INT,
	@updBY AS varchar(20),
	@empType AS varchar(15),  
	@iniDate AS datetime,
	@endDate AS datetime,
	@sala AS DECIMAL,
	@empID AS int,
	@posID AS int,
	@projID AS int,
    @msg AS VARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;


    Begin Try
		
        UPDATE [dbo].[contract] 
		set		updated_at		= SYSDATETIME(),
				updated_by		= @updBY,
				employee_type	= @empType,
				init_date		= @iniDate,
				end_date		= @endDate,
				salary			= @sala,
				employee_id		= @empID,
				position_id		= @posID,
				project_id		= @projID
		where id = @conID
        SET @msg = 'El contrato fue actualizado correctamente .';

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

    End Catch

END
GO
/********************************************************************************************************
******************* CREATE STORE PROCEDURE 'CREATE, UPDATE, DELETE, GET' ACCIDENT *****************************
**  BD  : g2ssid -- Sql Server 2014
**  Author: Nicol Dayana Balderrama Guzman
**
*********************************************************************************************************/

PRINT 'CREATING STORE PROCEDURE INSERT ACCIDENT....';

IF OBJECT_ID('SP_InsertAccident', 'P') IS NOT NULL
    DROP PROCEDURE  SP_InsertAccident
go

CREATE PROCEDURE SP_InsertAccident
   @created_by as varchar(20)
   ,@accident_type as varchar(15)
   ,@assigned as varchar(8)
   ,@body as varchar(15)
   ,@cause as varchar(255)
   ,@date_init as datetime
   ,@day_debited as varchar(255)
   ,@day_lost as varchar(255)
   ,@end_lost_time as datetime
   ,@factor as varchar(15)
   ,@frecuency as varchar(8)
   ,@kind as varchar(15)
   ,@medication as varchar(8)
   ,@receive as varchar(15)
   ,@severity as varchar(15)
   ,@start_lost_time as datetime
   ,@turn as varchar(15)
   ,@way as varchar(15)
   ,@employee_id as bigint
	,@msg AS VARCHAR(100) OUTPUT
	,@id int OUTPUT


AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

        INSERT INTO [dbo].[accident]
           ([created_at]
           ,[created_by]
           ,[accident_type]
           ,[assigned]
           ,[body]
           ,[cause]
           ,[date_init]
           ,[day_debited]
           ,[day_lost]
           ,[end_lost_time]
           ,[factor]
           ,[frecuency]
           ,[kind]
           ,[medication]
           ,[receive]
           ,[severity]
           ,[start_lost_time]
           ,[turn]
           ,[way]
           ,[employee_id])
     VALUES
           (SYSDATETIME()
           ,@created_by
           ,@accident_type
           ,@assigned
           ,@body
           ,@cause
           ,@date_init
           ,@day_debited
           ,@day_lost
           ,@end_lost_time
           ,@factor
           ,@frecuency
           ,@kind
           ,@medication
           ,@receive
           ,@severity
           ,@start_lost_time
           ,@turn
           ,@way
           ,@employee_id)

        SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El accidente se registro correctamente. con id: '+ CONVERT(nvarchar(100), @id);

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la linea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

        Rollback TRAN Tadd

    End Catch

END
GO

/*******************************************************************************************
-- CREATE STORE PROCEDURE UPDATE ACCIDENT
*******************************************************************************************/

PRINT 'CREATING STORE PROCEDURE UPDATE ACCIDENT....';

IF OBJECT_ID('SP_UpdateAccident', 'P') IS NOT NULL
    DROP PROCEDURE  SP_UpdateAccident
go

CREATE PROCEDURE SP_UpdateAccident
	@id as int
   ,@updated_by as varchar(20)
   ,@accident_type as varchar(15)
   ,@assigned as varchar(8)
   ,@body as varchar(15)
   ,@cause as varchar(255)
   ,@date_init as datetime
   ,@day_debited as varchar(255)
   ,@day_lost as varchar(255)
   ,@end_lost_time as datetime
   ,@factor as varchar(15)
   ,@frecuency as varchar(8)
   ,@kind as varchar(15)
   ,@medication as varchar(8)
   ,@receive as varchar(15)
   ,@severity as varchar(15)
   ,@start_lost_time as datetime
   ,@turn as varchar(15)
   ,@way as varchar(15)
   ,@employee_id as bigint
	,@msg AS VARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try

	UPDATE [dbo].[accident]
	 SET updated_at = SYSDATETIME()
	 ,updated_by = @updated_by
	 ,accident_type = @accident_type
	 ,assigned = @assigned
	 ,body = @body
	 ,cause = @cause
	 ,date_init = @date_init
	 ,day_debited = @day_debited
	 ,day_lost = @day_lost
	 ,end_lost_time = @end_lost_time
	 ,factor = @factor
	 ,frecuency = @frecuency
	 ,kind = @kind
	 ,medication = @medication
	 ,receive = @receive
	 ,severity = @severity
	 ,start_lost_time = @start_lost_time
	 ,turn = @turn
	 ,way = @way
	 ,employee_id = @employee_id
	 WHERE id = @id
     SET @msg = 'El actualizo el registro correctamente. con id: '+ CONVERT(nvarchar(100), @id);

     COMMIT TRAN Tadd

    End try
    Begin Catch
		SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
		Rollback TRAN Tadd
    End Catch

END
GO


/*******************************************************************************************
-- CREATE STORE PROCEDURE GET ACCIDENT
*******************************************************************************************/

IF OBJECT_ID('SP_get_accident', 'P') IS NOT NULL
DROP PROCEDURE SP_get_accident
GO

CREATE PROCEDURE SP_get_accident @id int
AS
BEGIN
  Select * From accident where id = @id;
END
GO


/*******************************************************************************************
-- CREATE STORE PROCEDURE DELETE ACCIDENT
*******************************************************************************************/

IF OBJECT_ID('SP_DeleteAccident', 'P') IS NOT NULL
  DROP PROCEDURE SP_DeleteAccident
GO

CREATE PROCEDURE SP_DeleteAccident @id int
AS
BEGIN
  delete From accident where id = @id;
END
GO




