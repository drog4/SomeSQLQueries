
GO
ALTER DATABASE drogaytsev_motors SET RECOVERY FULL;  
GO
USE drogaytsev_motors;
INSERT INTO mark VALUES ('Geely1');
GO
INSERT INTO model VALUES ('Emgrand', 6);
GO
DELETE FROM car;
GO
USE master
GO
BACKUP LOG drogaytsev_motors 
   TO DISK = N'C:\forLogBackups\activeLog.trn'
   WITH NO_TRUNCATE;  
GO
USE master;
RESTORE DATABASE drogaytsev_motors
   FROM DISK = N'C:\forDbBackups\drogaytsevMotorsDbBackup_2020-02-07_18-31-12.bak' WITH NORECOVERY;  
GO
USE master;
RESTORE DATABASE drogaytsev_motors
   FROM DISK = N'C:\forDifDbBackups\drogaytsevMotorsDifDbBackup_2020-02-07_19-34-02.bak' WITH NORECOVERY;  
GO
RESTORE LOG drogaytsev_motors 
	FROM DISK = N'C:\forLogBackups\drogaytsevMotorsLogBackup_2020-02-07_19-36-58.trn'  WITH NORECOVERY;
GO
RESTORE LOG drogaytsev_motors 
	FROM DISK = N'C:\forLogBackups\activeLog.trn' WITH STOPAT = N'07.02.2020 19:54:10', RECOVERY;
GO
RESTORE DATABASE drogaytsev_motors WITH RECOVERY;
