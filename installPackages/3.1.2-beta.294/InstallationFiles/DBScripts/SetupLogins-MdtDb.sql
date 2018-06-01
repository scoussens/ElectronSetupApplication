USE [%MdtDatabaseName%]
GO

/*Add logins for web, and cache*/
If not Exists (select loginname from master.dbo.syslogins 
    where loginname = '%PortalUser%' or '%PortalUser%' = '~na' )
Begin
	CREATE LOGIN [%PortalUser%] FROM WINDOWS WITH DEFAULT_DATABASE=[%MdtDatabaseName%]
End

if not Exists (SELECT name FROM sys.database_principals WHERE name = '%PortalUser%' or  '%PortalUser%' = '~na')
Begin
	CREATE USER [%PortalUser%] FOR LOGIN [%PortalUser%]
End

if('%PortalUser%' <> '~na')
Begin
exec sp_addrolemember [db_datareader],  [%PortalUser%]
exec sp_addrolemember [db_datawriter],  [%PortalUser%]
End
