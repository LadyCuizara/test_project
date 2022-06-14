-- Creacion de triggers de Cargos
/******************************************************************************
**  Name: TG_Position_InsertUpdate
**  Desc: Audit History for Cargo table
**  Author: Giovana Aleman Mamani
**  Date: 08/07/2018

*******************************************************************************/
USE g2ssid

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TG_Position_InsertUpdate]'))
begin
	DROP TRIGGER [dbo].[TG_Position_InsertUpdate]
	PRINT 'TG_Position_InsertUpdate was deleted..';
end
go
 
CREATE TRIGGER [dbo].[TG_Position_InsertUpdate]
ON [dbo].[position]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @ip_address varchar(30)= (SELECT client_net_address FROM sys.dm_exec_connections    WHERE Session_id = @@SPID);
  DECLARE @CurrDate DATETIME = GETUTCDATE();
   
 
  IF UPDATE(name)
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
    SELECT TableName    = 'Position', 
           ColumnName   = 'name',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[name], 
           NewValue     = i.[name],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name, '');
	END
 
IF UPDATE (description) 
   
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
    SELECT TableName    = 'Position', 
           ColumnName   = 'description',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.[description], 
           NewValue     = i.[description],
		   CreateBy     = d.[created_by],
           ModifiedBy   = system_user, 
		   Action       =   'Modificado',
		   UsersAddress = @ip_address      
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.description, '') != ISNULL(i.description, '');
  END
  
END;
GO
PRINT '[TG_Position_InsertUpdate] trigger was created!';


--eleiminar

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TG_Position_Delete]'))
BEGIN
  DROP TRIGGER [dbo].[TG_Position_Delete]
  PRINT 'TG_Position_Delete was deleted...';
END
go

 CREATE TRIGGER [dbo].[TG_Position_Delete]
ON [dbo].[position]
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
    VALUES( 'Position', 
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
PRINT '[TG_Position_Delete] trigger was created!';





