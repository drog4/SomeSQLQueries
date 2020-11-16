USE msdb
GO
EXEC sp_add_schedule  
		@schedule_name = 'BackupDbSchedule',
		@enabled = 1, 
		@freq_type = 8, 
		@freq_interval = 1, 
		@freq_subday_type = 1, 
		@freq_subday_interval = 0, 
		@freq_relative_interval = 0, 
		@freq_recurrence_factor = 1, 
		@active_start_date = 20200207, 
		@active_end_date = 99991231, 
		@active_start_time = 200000, 
		@active_end_time = 235959
GO
EXEC sp_add_schedule  
		@schedule_name = 'BackupDifDbSchedule',
		@enabled = 1, 
		@freq_type = 8, 
		@freq_interval = 126, 
		@freq_subday_type = 1, 
		@freq_subday_interval = 0, 
		@freq_relative_interval = 0, 
		@freq_recurrence_factor = 1, 
		@active_start_date = 20200207, 
		@active_end_date = 99991231, 
		@active_start_time=0, 
		@active_end_time = 235959
GO
EXEC sp_add_schedule  
		@schedule_name = 'BackupLogSchedule',
		@enabled = 1, 
		@freq_type = 4, 
		@freq_interval = 1, 
		@freq_subday_type = 8, 
		@freq_subday_interval = 8,
		@freq_relative_interval = 0, 
		@freq_recurrence_factor = 1, 
		@active_start_date = 20200207, 
		@active_end_date = 99991231, 
		@active_start_time = 0, 
		@active_end_time=235959
GO
DECLARE @jobId BINARY(16)
EXEC  sp_add_job @job_name = N'BackupDatabaseDrogaytsevMotors', 
		@enabled = 1, 
		@notify_level_eventlog = 0, 
		@notify_level_email = 2, 
		@notify_level_page = 2, 
		@delete_level = 0, 
		@category_name = N'[Uncategorized (Local)]', 
		@owner_login_name = N'ACER\user', @job_id = @jobId OUTPUT
SELECT @jobId
GO
EXEC sp_add_jobserver @job_name = N'BackupDatabaseDrogaytsevMotors', @server_name = N'ACER\VLADIMIRSERVER'
GO
EXEC sp_add_jobstep @job_name = N'BackupDatabaseDrogaytsevMotors', @step_name = N'first', 
		@step_id = 1, 
		@cmdexec_success_code = 0, 
		@on_success_action = 1, 
		@on_fail_action = 2, 
		@retry_attempts = 0, 
		@retry_interval = 0, 
		@os_run_priority = 0, 
		@subsystem=N'TSQL', 
		@command = N' GO
		DECLARE @db_path VARCHAR(max)=N''C:\forDbBackups\drogaytsevMotorsDbBackup_''
							+ REPLACE(REPLACE(CONVERT(VARCHAR(max), GETDATE(), 20), '' '', ''_''),  '':'', ''-'') + N''.bak''
		BACKUP DATABASE drogaytsev_motors TO  DISK = @db_path WITH NOFORMAT, NOINIT, SKIP
		GO', 
		@database_name = N'master', 
		@flags=0
GO
EXEC sp_update_job @job_name = N'BackupDatabaseDrogaytsevMotors', 
		@enabled = 1, 
		@start_step_id = 1, 
		@notify_level_eventlog = 0, 
		@notify_level_email = 2,  
		@notify_level_page = 2, 
		@delete_level = 0, 
		@description = N'', 
		@category_name = N'[Uncategorized (Local)]', 
		@owner_login_name = N'ACER\user', 
		@notify_email_operator_name = N'', 
		@notify_page_operator_name = N''
GO
DECLARE @jobId BINARY(16)
EXEC  sp_add_job @job_name = N'BackupDifferentialDatabaseDrogaytsevMotors', 
		@enabled = 1, 
		@notify_level_eventlog = 0, 
		@notify_level_email = 2, 
		@notify_level_page = 2, 
		@delete_level = 0, 
		@category_name = N'[Uncategorized (Local)]', 
		@owner_login_name = N'ACER\user', @job_id = @jobId OUTPUT
SELECT @jobId
GO
EXEC sp_add_jobserver @job_name = N'BackupDifferentialDatabaseDrogaytsevMotors', @server_name = N'ACER\VLADIMIRSERVER'
GO
EXEC sp_add_jobstep @job_name = N'BackupDifferentialDatabaseDrogaytsevMotors', @step_name = N'first', 
		@step_id = 1, 
		@cmdexec_success_code = 0, 
		@on_success_action = 1, 
		@on_fail_action = 2, 
		@retry_attempts = 0, 
		@retry_interval = 0, 
		@os_run_priority = 0, 
		@subsystem=N'TSQL', 
		@command = N' GO
		DECLARE @db_path VARCHAR(max)=N''C:\forDifDbBackups\drogaytsevMotorsDifDbBackup_''
							+ REPLACE(REPLACE(CONVERT(VARCHAR(max), GETDATE(), 20), '' '', ''_''),  '':'', ''-'') + N''.bak''
		BACKUP DATABASE drogaytsev_motors TO  DISK = @db_path WITH NOFORMAT, NOINIT, SKIP
		GO', 
		@database_name = N'master', 
		@flags=0
GO
EXEC sp_update_job @job_name = N'BackupDifferentialDatabaseDrogaytsevMotors', 
		@enabled = 1, 
		@start_step_id = 1, 
		@notify_level_eventlog = 0, 
		@notify_level_email = 2,  
		@notify_level_page = 2, 
		@delete_level = 0, 
		@description = N'', 
		@category_name = N'[Uncategorized (Local)]', 
		@owner_login_name = N'ACER\user', 
		@notify_email_operator_name = N'', 
		@notify_page_operator_name = N''
GO
DECLARE @jobId BINARY(16)
EXEC  sp_add_job @job_name = N'BackupLogDrogaytsevMotors', 
		@enabled = 1, 
		@notify_level_eventlog = 0, 
		@notify_level_email = 2, 
		@notify_level_page = 2, 
		@delete_level = 0, 
		@category_name = N'[Uncategorized (Local)]', 
		@owner_login_name = N'ACER\user', @job_id = @jobId OUTPUT
SELECT @jobId
GO
EXEC sp_add_jobserver @job_name = N'BackupLogDrogaytsevMotors', @server_name = N'ACER\VLADIMIRSERVER'
GO

EXEC sp_add_jobstep @job_name = N'BackupLogDrogaytsevMotors', @step_name = N'first', 
		@step_id = 1, 
		@cmdexec_success_code = 0, 
		@on_success_action = 1, 
		@on_fail_action = 2, 
		@retry_attempts = 0, 
		@retry_interval = 0, 
		@os_run_priority = 0, @subsystem = N'TSQL', 
		@command = N'GO
		DECLARE @log_path VARCHAR(max)=N''C:\forLogBackups\drogaytsevMotorsLogBackup_''
							+ REPLACE(REPLACE(CONVERT(VARCHAR(max), GETDATE(), 20), '' '', ''_''),  '':'', ''-'') + N''.trn''
		BACKUP LOG drogaytsev_motors TO DISK = @log_path WITH DIFFERENTIAL,  NOFORMAT, NOINIT, SKIP
		GO', 
		@database_name = N'master', 
		@flags = 0
GO
EXEC sp_update_job @job_name = N'BackupLogDrogaytsevMotors', 
		@enabled = 1, 
		@start_step_id = 1, 
		@notify_level_eventlog = 0, 
		@notify_level_email = 2, 
		@notify_level_page = 2, 
		@delete_level = 0, 
		@description = N'', 
		@category_name = N'[Uncategorized (Local)]', 
		@owner_login_name = N'ACER\user', 
		@notify_email_operator_name = N'', 
		@notify_page_operator_name = N''
GO
EXEC sp_attach_schedule  
   @job_name = N'BackupDatabaseDrogaytsevMotors',  
   @schedule_name = N'BackupDbShedule';  
GO  
EXEC sp_attach_schedule  
   @job_name = N'BackupDifferentialDatabaseDrogaytsevMotors',  
   @schedule_name = N'BackupDifDbShedule';  
GO  
EXEC sp_attach_schedule  
   @job_name = N'BackupLogDrogaytsevMotors',  
   @schedule_name = N'BackupLogShedule';  
GO  




