USE [msdb];
GO
DECLARE @jobIdDelete binary(16)
SELECT  @jobIdDelete = job_id FROM msdb.dbo.sysjobs WHERE (name = N'DWg2ssid ETL')
IF (@jobIdDelete IS NOT NULL)
BEGIN
    EXEC msdb.dbo.sp_delete_job @jobIdDelete, @delete_unused_schedule=1
END
GO

BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0;
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
END
DECLARE @jobId binary(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DWg2ssid ETL', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT

IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Pull g2ssid Data', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXECUTE [ETL].[PullDataToDatawarehouse] @table = ''Employee'';
		EXECUTE [ETL].[PullDataToDatawarehouse] @table = ''Project'';
		EXECUTE [ETL].[PullDataToDatawarehouse] @table = ''Department'';
		EXECUTE [ETL].[PullDataToDatawarehouse] @table = ''Accident'';
		EXECUTE [ETL].[PullDataToDatawarehouse] @table = ''Accidents'';', 
		@database_name=N'g2ssid', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Merge g2ssid and DWg2ssid Data', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXECUTE [ETL].[DW_MergeProject];
		EXECUTE [ETL].[DW_MergeAccident];
		EXECUTE [ETL].[DW_MergeDepartment];
		EXECUTE [ETL].[DW_MergeEmployee];
		EXECUTE [ETL].[DW_MergeAccidents];', 
		@database_name=N'DWg2ssid', 
		@flags=0


IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Clean Staging Area', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'TRUNCATE TABLE [ETL].[Project];
TRUNCATE TABLE [ETL].[Department];
TRUNCATE TABLE [ETL].[Employee];
TRUNCATE TABLE [ETL].[Accident];
TRUNCATE TABLE [ETL].[Accidents];', 
		@database_name=N'DWg2ssid', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 10 seconds', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=2, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20180521, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'1a21aa1d-7f07-470e-8345-2f5b9db2ada7'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


