--Creacion del trigger para Insert/Update on Equiment
/******************************************************************************
**  Name: TG_Equipment(Audit)_InsertUpdate
**  Desc: Audit History to equipment table
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
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Equipment(Audit)_InsertUpdate]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Equipment(Audit)_InsertUpdate];
  PRINT '[TG_Equipment(Audit)_InsertUpdate] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_Equipment(Audit)_InsertUpdate]
ON [dbo].[equipment]
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
  ** TABLE: equipment
  ** FIELD: acquisition_date
  ***********************/
  IF UPDATE(acquisition_date)
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
    SELECT TableName    = 'equipment', 
           ColumnName   = 'acquisition_date',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.acquisition_date, 
           NewValue     = i.acquisition_date,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address       
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.acquisition_date, '') != ISNULL(i.acquisition_date, '');
	END

/**********************
  ** TABLE: equipment
  ** FIELD: available
  ***********************/
  IF UPDATE(available)
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
    SELECT TableName    = 'equipment', 
           ColumnName   = 'available',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.available, 
           NewValue     = i.available,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.available, '') != ISNULL(i.available, '');
	END

/**********************
  ** TABLE: equipment
  ** FIELD: code
  ***********************/
  IF UPDATE(Code)
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
    SELECT TableName    = 'equipment', 
           ColumnName   = 'code',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.code, 
           NewValue     = i.code,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.code, '') != ISNULL(i.code, '');
	END

/**********************
  ** TABLE: equipment
  ** FIELD: state
  ***********************/
  IF UPDATE(state)
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
    SELECT TableName    = 'equipment', 
           ColumnName   = 'state',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.state, 
           NewValue     = i.state,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.state, '') != ISNULL(i.state, '');
	END

/**********************
  ** TABLE: equipment
  ** FIELD: category_id
  ***********************/
  IF UPDATE(category_id)
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
    SELECT TableName    = 'equipment', 
           ColumnName   = 'category_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.category_id, 
           NewValue     = i.category_id,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.category_id, '') != ISNULL(i.category_id, '');
	END


 END;
GO
PRINT '[TG_Equipment(Audit)_InsertUpdate] trigger was created!';


--Creacion del trigger para Delete on Equiment
/******************************************************************************
**  Name: TG_Equipment(Audit)_Delete
**  Desc: Audit History to equipment table
** 
**  Author: Judith Delgadillo 
*******************************************************************************/

/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Equipment(Audit)_Delete]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Equipment(Audit)_Delete];
  PRINT '[TG_Equipment(Audit)_Delete] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_Equipment(Audit)_Delete]
ON [dbo].[equipment]
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
    VALUES( 'equipment', 
           'code',
           (SELECT TOP 1 deleted.id FROM deleted), 
           @CurrDate, 
           (SELECT TOP 1 deleted.code FROM deleted), 
           'Null',
		   (SELECT TOP 1 deleted.created_by FROM deleted),
           @user,  
		   'Eliminado',
		    @ip_address);        

 END;
GO
PRINT '[TG_Equipment(Audit)_Delete] trigger was created!';




