use g2ssid
go

-- CREATE STORE PROCEDURE INSERT PROJECT
PRINT 'CREATING STORE PROCEDURE INSERT PROJECT....';

IF OBJECT_ID('SP_InsertProject', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertProject
go

CREATE PROCEDURE SP_InsertProject
    --@cre_at AS datetime,
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

        INSERT INTO [dbo].[project] (updated_at,updated_by,description, name, place,status_project)
		VALUES (SYSDATETIME(),@cre_by, @des,@nam, @pla, @est)

		SELECT @id = SCOPE_IDENTITY()
		SET @msg = 'El projecto se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO


-- CREATE STORE PROCEDURE INSERT DEPATMENT
PRINT 'CREATING STORE PROCEDURE INSERT DEPATMENT....';

IF OBJECT_ID('SP_InsertDepartment', 'P') IS NOT NULL
    DROP PROCEDURE SP_InsertDepartment
go

CREATE PROCEDURE SP_InsertDepartment
    --@cre_at AS datetime,
	@cre_by AS varchar(20),
	@desc AS VARCHAR(255),
    @nam AS VARCHAR(255),
	--@a   As datetime OUTPUT,
    @msg AS VARCHAR(100) OUTPUT,
    @id int OUTPUT

AS
BEGIN
    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try
		INSERT INTO [dbo].[department] (updated_at,updated_by,description,name)
		VALUES (SYSDATETIME(),@cre_by, @desc,@nam)

		SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El Departamento se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO

-- CREATE STORE PROCEDURE INSERT EMPLOYEE
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

        INSERT INTO [dbo].[employee] (updated_at,updated_by,first_name,last_name, ci,birth_date,email,address,gender,phone_number)
		VALUES (SYSDATETIME(),@cre_by, @fnam,@lnam,@ci, @birt,@emai,@addr,@gend, @phon)
		--select @a = scope_identity();

		SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El empleado se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO


-- CREATE STORE PROCEDURE INSERT EQUIPMENT_CATEGORY
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

        INSERT INTO [dbo].[equipment_category] (updated_at,updated_by,description,equipment_type,image_path,name)
        VALUES (SYSDATETIME(),@cre_by, @desc,@eqType,@imag,@nam)

        SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'La categoria se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO


-- CREATE STORE PROCEDURE INSERT EQUIPMENT
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

        INSERT INTO [dbo].[equipment] (updated_at,updated_by,acquisition_date,available,code,state,category_id)
        VALUES (SYSDATETIME(),@cre_by, @acDate,@avai,@code,@stat,@catID)

        SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El equipo se registro correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO

-- CREATE STORE PROCEDURE INSERT EQUIPMENT ASSIGNMENT
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

        INSERT INTO [dbo].[equipment_assignment] (updated_at,updated_by,active,init_date,employee_id,equipment_id)
        VALUES (SYSDATETIME(),@cre_by, 1,SYSDATETIME(),@emplID,@equiID)

        SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El equipo fue assignado correctamente correctamente al empleado. con id: '+ @emplID;

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO

-- CREATE STORE PROCEDURE INSERT POSITION
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

        INSERT INTO [dbo].[position] (updated_at,created_by,description,name)
        VALUES (SYSDATETIME(),@cre_by, @desc,@nam)
        SELECT @id = SCOPE_IDENTITY()
        SET @msg = 'El cargo fue creado correctamente. con id: '+ CONVERT(nvarchar(100), SCOPE_IDENTITY());

        COMMIT TRAN Tadd

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
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

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'
        Rollback TRAN Tadd

    End Catch

END
GO
