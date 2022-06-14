--Creacion del trigger para Insert/Update on Accident
/******************************************************************************
**  Name: TG_Accident(Audit)_InsertUpdate
**  Desc: Audit History to Accident table
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
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Accident(Audit)_InsertUpdate]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Accident(Audit)_InsertUpdate];
  PRINT '[TG_Accident(Audit)_InsertUpdate] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_Accident(Audit)_InsertUpdate]
ON [dbo].[accident]
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
  ** TABLE: Accident
  ** FIELD: employee_id
  ***********************/
  IF UPDATE(employee_id)
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
    SELECT TableName    = 'accident', 
           ColumnName   = 'employee_id',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.employee_id, 
           NewValue     = i.employee_id,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.employee_id, '') != ISNULL(i.employee_id, '');
	END

  /**********************
  ** TABLE: Accident
  ** FIELD: accident_type
  ***********************/
  IF UPDATE(accident_type)
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
    SELECT TableName    = 'accident', 
           ColumnName   = 'accident_type',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.accident_type, 
           NewValue     = i.accident_type,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.accident_type, '') != ISNULL(i.accident_type, '');
	END

	/**********************
  ** TABLE: accident
  ** FIELD: cause
  ***********************/
  IF UPDATE(cause)
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
    SELECT TableName    = 'accident', 
           ColumnName   = 'cause',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.cause, 
           NewValue     = i.cause,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.cause, '') != ISNULL(i.cause, '');
	END

/**********************
  ** TABLE: accident
  ** FIELD: date_init
  ***********************/
  IF UPDATE(date_init)
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
           ColumnName   = 'date_init',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.date_init, 
           NewValue     = i.date_init,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.date_init, '') != ISNULL(i.date_init, '');
	END

/**********************
  ** TABLE: accident
  ** FIELD: day_debited
  ***********************/
  IF UPDATE(day_debited)
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
           ColumnName   = 'day_debited',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.day_debited, 
           NewValue     = i.day_debited,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.day_debited, '') != ISNULL(i.day_debited, '');
	END

/**********************
  ** TABLE: accident
  ** FIELD: day_lost
  ***********************/
  IF UPDATE(day_lost)
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
    SELECT TableName    = 'accident', 
           ColumnName   = 'day_lost',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.day_lost, 
           NewValue     = i.day_lost,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.day_lost, '') != ISNULL(i.day_lost, '');
	END

/**********************
  ** TABLE: accident
  ** FIELD: factor
  ***********************/
  IF UPDATE(factor)
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
    SELECT TableName    = 'accident', 
           ColumnName   = 'factor',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.factor, 
           NewValue     = i.factor,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.factor, '') != ISNULL(i.factor, '');
	END

/**********************
  ** TABLE: accident
  ** FIELD: kind
  ***********************/
  IF UPDATE(kind)
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
    SELECT TableName    = 'accident', 
           ColumnName   = 'kind',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.kind, 
           NewValue     = i.kind,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.kind, '') != ISNULL(i.kind, '');
	END

/**********************
  ** TABLE: accident
  ** FIELD: severity
  ***********************/
  IF UPDATE(severity)
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
    SELECT TableName    = 'accident', 
           ColumnName   = 'severity',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.severity, 
           NewValue     = i.severity,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.severity, '') != ISNULL(i.severity, '');
	END

/**********************
  ** TABLE: accident
  ** FIELD: turn
  ***********************/
  IF UPDATE(turn)
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
    SELECT TableName    = 'accident', 
           ColumnName   = 'turn',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.turn, 
           NewValue     = i.turn,
		   CreateBy     = d.created_by,
           ModifiedBy   = @user,  
		   Action       = 'Modificado',
		   UsersAddress =  @ip_address        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.turn, '') != ISNULL(i.turn, '');
	END

 END;
GO
PRINT '[TG_Accident(Audit)_InsertUpdate] trigger was created!';


--Creacion del trigger para Delete on Accident
/******************************************************************************
**  Name: TG_Accident(Audit)_Delete
**  Desc: Audit History to accident table
** 
**  Author: Judith Delgadillo 
*******************************************************************************/

/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Accident(Audit)_Delete]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Accident(Audit)_Delete];
  PRINT '[TG_Accident(Audit)_Delete] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_Accident(Audit)_Delete]
ON [dbo].[accident]
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
    VALUES( 'accident', 
           'employee_id',
           (SELECT TOP 1 deleted.id FROM deleted), 
           @CurrDate, 
           (SELECT TOP 1 deleted.employee_id FROM deleted), 
           'Null',
		   (SELECT TOP 1 deleted.created_by FROM deleted),
           @user,  
		   'Eliminado',
		    @ip_address);        

 END;
GO
PRINT '[TG_Accident(Audit)_Delete] trigger was created!';
