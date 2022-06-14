--Creacion del trigger para Insert/Update on Project
/******************************************************************************
**  Name: TG_Project(Audit)_InsertUpdate
**  Desc: Audit History to Project table
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
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Project(Audit)_InsertUpdate]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Project(Audit)_InsertUpdate];
  PRINT '[TG_Project(Audit)_InsertUpdate] trigger fue eliminado!';
END
GO


CREATE TRIGGER [dbo].[TG_Project(Audit)_InsertUpdate]
ON [dbo].[project]
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
  ** TABLE: project
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
    SELECT TableName    = 'project', 
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

	/**********************
  ** TABLE: project
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
    SELECT TableName    = 'project', 
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
  ** TABLE: project
  ** FIELD: place
  ***********************/
  IF UPDATE(place)
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
    SELECT TableName    = 'project', 
           ColumnName   = 'place',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.place, 
           NewValue     = i.place,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress = @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.place, '') != ISNULL(i.place, '');
	END

	/**********************
  ** TABLE: project
  ** FIELD: status_project
  ***********************/
  IF UPDATE(status_project)
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
    SELECT TableName    = 'project', 
           ColumnName   = 'status_project',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.status_project, 
           NewValue     = i.status_project,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.status_project, '') != ISNULL(i.status_project, '');
	END

 END;
GO
PRINT '[TG_Project(Audit)_InsertUpdate] trigger was created!';


--Creacion del trigger para Delete on Project
/******************************************************************************
**  Name: TG_Project(Audit)_Delete
**  Desc: Audit History to Project table
** 
**  Author: Judith Delgadillo 
*******************************************************************************/

/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Project(Audit)_Delete]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Project(Audit)_Delete];
  PRINT '[TG_Project(Audit)_Delete] trigger fue eliminado!';
END
GO


CREATE TRIGGER [dbo].[TG_Project(Audit)_Delete]
ON [dbo].[project]
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
    VALUES( 'project', 
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
PRINT '[TG_Project(Audit)_Delete] trigger was created!';
