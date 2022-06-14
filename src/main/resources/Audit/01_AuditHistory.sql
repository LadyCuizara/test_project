USE g2ssid
go
	
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE XTYPE='U' AND NAME = 'AuditHistory')
BEGIN
      PRINT 'Tabla AuditHistory ya existe en la BD'
      DROP TABLE AuditHistory
      PRINT 'Tabla AuditHistory esta siendo borrada de la BD';
END

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[AuditHistory]') 
		       AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuditHistory]
(
	[AuditHistoryId] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_AuditHistory] PRIMARY KEY,
	[TableName]		 VARCHAR(50) NULL,
	[ColumnName]	 VARCHAR(50) NULL,
	[ID]             INT NULL,
	[Date]           DATETIME NULL,
	[Oldvalue]       VARCHAR(MAX) NULL,
	[NewValue]       VARCHAR(MAX) NULL,
	[CreateBy]       VARCHAR(MAX) NULL,
	[ModifiedBy]     VARCHAR(50) NULL,
	[Action]         VARCHAR(50) NULL,
	[UsersAddress]	 VARCHAR(30) NULL
);
PRINT 'Tabla AuditHistory creada!';
	END
GO
