--Creacion del trigger para Insert/Update on Department
/******************************************************************************
**  Name: TG_Department(Audit)_InsertUpdate
**  Desc: Audit History to Department table
** 
**  Author: Judith Delgadillo 
**
**  Date: 01/07/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:           Description:
** --------     -----------      -----------------------------------------------
** 01/07/2018   Judith Delgadillo    Initial version
** 06/07/2018   Judith Delgadillo    Completing fields to be completely mapped
*******************************************************************************/

USE [g2ssid];

/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Department(Audit)_InsertUpdate]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Department(Audit)_InsertUpdate];
  PRINT '[TG_Department(Audit)_InsertUpdate] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_Department(Audit)_InsertUpdate]
ON [dbo].[department]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @ip_address varchar(30)= (SELECT client_net_address FROM sys.dm_exec_connections    WHERE Session_id = @@SPID);
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  DECLARE @user VARCHAR(50) = system_user ;

  /**********************
  ** TABLE: department
  ** FIELD: name
  ***********************/
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
    SELECT TableName    = 'department', 
           ColumnName   = 'name',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.name, 
           NewValue     = i.name,
		   CreateBy     = d.created_by, 
           ModifiedBy   = @user, 
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name, '');
	END

	/**********************
  ** TABLE: department
  ** FIELD: description
  ***********************/
  IF UPDATE(description)
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
    SELECT TableName    = 'department', 
           ColumnName   = 'description',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.description, 
           NewValue     = i.description,
		   CreateBy     = d.created_by, 
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.description, '') != ISNULL(i.description, '');
	END

 END;
GO
PRINT '[TG_Department(Audit)_InsertUpdate] trigger was created!';

--Creacion del trigger para Delete on Department
/******************************************************************************
**  Name: TG_Department(Audit)_Delete
**  Desc: Audit History to Department table
** 
**  Author: Judith Delgadillo 
*******************************************************************************/

/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Department(Audit)_Delete]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Department(Audit)_Delete];
  PRINT '[TG_Department(Audit)_Delete] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_Department(Audit)_Delete]
ON [dbo].[department]
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
    VALUES( 'department', 
           'name',
           (SELECT TOP 1 deleted.id FROM deleted), 
           @CurrDate, 
           (SELECT TOP 1 deleted.name FROM deleted), 
           'Null',
		   (SELECT TOP 1 deleted.created_by FROM deleted),
           @user,  
		   'Eliminado',
		    @ip_address);        

 END;
GO
PRINT '[TG_Department(Audit)_Delete] trigger was created!';