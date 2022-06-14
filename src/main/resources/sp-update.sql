use g2ssid
go

-- CREATE STORE PROCEDURE UPDATE PROJECT
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

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

    End Catch

END
GO


-- CREATE STORE PROCEDURE UPDATE EMPLOYEE
PRINT 'CREATING STORE PROCEDURE UPDATE EMPLOYEE....'; 
IF OBJECT_ID('SP_UpdateEmployee', 'P') IS NOT NULL
    DROP PROCEDURE SP_UpdateEmployee
go

CREATE PROCEDURE SP_UpdateEmployee
    @empID AS int,
	@updBy AS varchar(20),
	@fnam AS VARCHAR(255),
	@lnam AS VARCHAR(255),  
	@ci AS int,	
	@birt AS datetime2,
	@emai AS VARCHAR(255),
	@addr AS VARCHAR(255),
    @gend AS VARCHAR(15),
	@phon AS int,	
	--@a   As datetime OUTPUT,
    @msg AS VARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;
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

        SET @msg = 'Los datos del empleado con id: '+ @empID +'se actualizaron correctamente.';

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

    End Catch

END
go




-- CREATE STORE PROCEDURE UPDATE DEPATMENT
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


    Begin Try
		update [dbo].[department] 
		set updated_at		= SYSDATETIME(),
			updated_by		= @updBY,
			description		= @desc,
			name			= @nam
		where id=@depID
        SET @msg = 'El Departamento con id '+@depID+' se actualizo correctamente.' ;

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

    End Catch

END
GO
-- CREATE STORE PROCEDURE UPDATE EQUIPMENT_CATEGORY
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


    Begin Try
		
        UPDATE [dbo].[equipment_category]
		SET updated_at		= SYSDATETIME(),
			updated_by		= @updBY,
			description		= @desc,
			equipment_type	= @eqType,
			image_path		= @imag,
			name			= @nam
		where id = @catID
        SET @msg = 'La categoria con id: ' +@catID +' se actualizo correctamente.';

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

    End Catch

END
GO


-- CREATE STORE PROCEDURE UPDATE EQUIPMENT
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

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

    End Catch

END
GO

-- CREATE STORE PROCEDURE UPDATE EQUIPMENT ASSIGNMENT
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

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

    End Catch

END
GO

-- CREATE STORE PROCEDURE UPDATE POSITION
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
        SET @msg = 'El cargo fue actualizado correctamente. ';

    End try
    Begin Catch

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

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

        SET @msg = 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la l�nea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '.'

    End Catch

END
GO


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




