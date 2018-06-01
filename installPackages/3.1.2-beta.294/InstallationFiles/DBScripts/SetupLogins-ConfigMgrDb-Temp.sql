USE [CM_LAB]
GO

/*Add logins for web, and cache*/
If not Exists (select loginname from master.dbo.syslogins 
    where loginname = 'CIRESON\cm_service' or 'CIRESON\cm_service' = '~na' )
Begin
	CREATE LOGIN [CIRESON\cm_service] FROM WINDOWS WITH DEFAULT_DATABASE=[CM_LAB]
End

if not Exists (SELECT name FROM sys.database_principals WHERE name = 'CIRESON\cm_service' or  'CIRESON\cm_service' = '~na')
Begin
	CREATE USER [CIRESON\cm_service] FOR LOGIN [CIRESON\cm_service]
End

if('CIRESON\cm_service' <> '~na')
Begin
exec sp_addrolemember [db_datareader],  [CIRESON\cm_service]
End


