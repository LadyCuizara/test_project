-- Creacion de triggers de Contract
/******************************************************************************
**  Name: TG_Contract_InsertUpdate
**  Desc: Audit History for Contract table
**  Author: Giovana Aleman Mamani
**  Date: 03/07/2018

*******************************************************************************/
USE g2ssid
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TG_Contract_InsertUpdate]'))
begin
   DROP TRIGGER [dbo].[TG_Contract_InsertUpdate]
   PRINT 'TG_Contract_InsertUpdate was deleted...';
   end
go
 
CREATE TRIGGER [dbo].[TG_Contract_InsertUpdate]
ON [dbo].[contract]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @ip_address varchar(30)= (SELECT client_net_address FROM sys.dm_exec_connections    WHERE Session_id = @@SPID);
  DECLARE @CurrDate DATETIME = GETUTCDATE();
   
 
  IF UPDATE(employee_type)
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
    SELECT TableName    = 'Contract', 
           ColumnName   = 'employee_type',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[employee_type], 
           NewValue     = i.[employee_type],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.employee_type, '') != ISNULL(i.employee_type, '');
	END
 
IF UPDATE (end_date) 
   
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
    SELECT TableName    = 'Contract', 
           ColumnName   = 'end_date',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[end_date], 
           NewValue     = i.[end_date],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.end_date, '') != ISNULL(i.end_date, '');
  END
 

 IF UPDATE (init_date) 
   
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
    SELECT TableName    = 'Contract', 
           ColumnName   = 'init_date',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[init_date], 
           NewValue     = i.[init_date],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.init_date, '') != ISNULL(i.init_date, '');
  END

  IF UPDATE (salary) 
   
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
    SELECT TableName    = 'Contract', 
           ColumnName   = 'salary',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[salary], 
           NewValue     = i.[salary],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.salary, '') != ISNULL(i.salary, '');
  END


IF UPDATE (employee_id) 
   
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
    SELECT TableName    = 'Contract', 
           ColumnName   = 'employee_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[employee_id], 
           NewValue     = i.[employee_id],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.employee_id, '') != ISNULL(i.employee_id, '');
  END

  IF UPDATE (position_id) 
   
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
    SELECT TableName    = 'Contract', 
           ColumnName   = 'position_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[position_id], 
           NewValue     = i.[position_id],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.position_id, '') != ISNULL(i.position_id, '');
  END
  
END;
GO
PRINT '[TG_Contract_InsertUpdate] trigger was created!';


--eliminar
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TG_Contract_Delete]'))
BEGIN
	DROP TRIGGER [dbo].[TG_Contract_Delete]
	PRINT 'TG_Contract_Delete was deleted...';
END
go

 CREATE TRIGGER [dbo].[TG_Contract_Delete]
ON [dbo].[contract]
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
    VALUES( 'Contract', 
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
PRINT '[TG_Contract_Delete] trigger was created!';







