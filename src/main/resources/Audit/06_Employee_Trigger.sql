-- Creacion de triggers de Employee
/******************************************************************************
**  Name: TG_Employee_InsertUpdate
**  Desc: Audit History for Employee table
**  Author: Giovana Aleman Mamani
**  Date: 03/07/2018

*******************************************************************************/
USE g2ssid

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TG_Employee_InsertUpdate]'))
begin
	DROP TRIGGER [dbo].[TG_Employee_InsertUpdate]
	PRINT '[TG_Employee_InsertUpdate] was deleted...';
end
go
 
CREATE TRIGGER [dbo].[TG_Employee_InsertUpdate]
ON [dbo].[employee]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @ip_address varchar(30)= (SELECT client_net_address FROM sys.dm_exec_connections    WHERE Session_id = @@SPID);
  DECLARE @CurrDate DATETIME = GETUTCDATE();
   
 
  IF UPDATE(email)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                              ColumnName, 
                              ID, 
                              Date, 
                              OldValue, 
                              NewValue,
							  CreateBy,
							  ModifiedBy,
							  Action,
							  UsersAddress) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'email',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[email], 
           NewValue     = i.[email],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.email, '') != ISNULL(i.email, '');
	END
 
IF UPDATE (phone_number) 
   
    BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                              ColumnName, 
                              ID, 
                              Date, 
                              OldValue, 
                              NewValue,
							  CreateBy,
							  ModifiedBy,
							  Action,
							  UsersAddress) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'phone_number',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[phone_number], 
           NewValue     = i.[phone_number],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.phone_number, '') != ISNULL(i.phone_number, '');
  END
 

 IF UPDATE (first_name) 
   
    BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                              ColumnName, 
                              ID, 
                              Date, 
                              OldValue, 
                              NewValue,
							  CreateBy,
							  ModifiedBy,
							  Action,
							  UsersAddress) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'first_name',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[first_name], 
           NewValue     = i.[first_name],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.first_name, '') != ISNULL(i.first_name, '');
  END

  IF UPDATE (last_name) 
   
    BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                              ColumnName, 
                              ID, 
                              Date, 
                              OldValue, 
                              NewValue,
							  CreateBy,
							  ModifiedBy,
							  Action,
							  UsersAddress) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'last_name',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[last_name], 
           NewValue     = i.[last_name],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.last_name, '') != ISNULL(i.last_name, '');
  END


IF UPDATE (address) 
   
    BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                              ColumnName, 
                              ID, 
                              Date, 
                              OldValue, 
                              NewValue,
							  CreateBy,
							  ModifiedBy,
							  Action,
							  UsersAddress) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'address',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[address], 
           NewValue     = i.[address],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.address, '') != ISNULL(i.address, '');
  END

  IF UPDATE (birth_date) 
   
    BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                              ColumnName, 
                              ID, 
                              Date, 
                              OldValue, 
                              NewValue,
							  CreateBy,
							  ModifiedBy,
							  Action,
							  UsersAddress) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'birth_date',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[birth_date], 
           NewValue     = i.[birth_date],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.birth_date, '') != ISNULL(i.birth_date, '');
  END

  IF UPDATE (ci) 
   
    BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                              ColumnName, 
                              ID, 
                              Date, 
                              OldValue, 
                              NewValue,
							  CreateBy,
							  ModifiedBy,
							  Action,
							  UsersAddress) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'ci',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[ci], 
           NewValue     = i.[ci],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.ci, '') != ISNULL(i.ci, '');
  END

  IF UPDATE (gender) 
   
    BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                              ColumnName, 
                              ID, 
                              Date, 
                              OldValue, 
                              NewValue,
							  CreateBy,
							  ModifiedBy,
							  Action,
							  UsersAddress) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'gender',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[gender], 
           NewValue     = i.[gender],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.gender, '') != ISNULL(i.gender, '');
  END

  
END;
GO
PRINT '[TG_Employee_InsertUpdate] trigger was created!';


--eliminar

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TG_Employee_Delete]'))
BEGIN
	DROP TRIGGER [dbo].[TG_Employee_Delete]
	PRINT '[TG_Employee_Delete] was deleted...';
END
go

 CREATE TRIGGER [dbo].[TG_Employee_Delete]
ON [dbo].[employee]
AFTER DELETE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @ip_address varchar(30)= (SELECT client_net_address FROM sys.dm_exec_connections    WHERE Session_id = @@SPID);
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  DECLARE @user VARCHAR(50) = system_user ;


  INSERT INTO dbo.AuditHistory
    VALUES( 'Employee', 
           'Null',
           (SELECT TOP 1 deleted.id FROM deleted), 
           @CurrDate, 
           (SELECT TOP 1 deleted.id FROM deleted), 
           'Null',
		   (SELECT TOP 1 deleted.created_by FROM deleted),
           @user,  
		   'Deleted',
		    @ip_address);        

 END;
GO
PRINT '[TG_Employee_Delete] trigger was created!';





