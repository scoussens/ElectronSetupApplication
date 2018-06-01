/*** [SYSTEMCLASS - BEGIN] ***/
DECLARE @SystemClassID int
DECLARE @SystemPageID int
DECLARE @parentId int

SET IDENTITY_INSERT SystemClass ON
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'system')
BEGIN	
  SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID= ISNULL(@SystemClassID,0)-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'System', 'system', 0, 0, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'settings')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Settings', 'settings', 0, 31, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'security')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Security', 'security', 0, 0, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'packages')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Software', 'packages', 31, 29, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'tasksequence')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Task Sequences', 'tasksequence', 31, 29, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'distribution')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Distribution', 'distribution', 31, 1, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'osd')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Computers', 'osd', 31, 0, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'support')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Support', 'support', 0, 0, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'softwareorder')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Software Order', 'softwareorder', 16, 0, 0)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'mdtroles')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'MDT Roles', 'mdtroles', 31, 31, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'remotetools')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'External Tools', 'remotetools', 0, 1, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'configmanager')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Config Manager', 'configmanager', 0, 0, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'settings/ou')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Organizational Units', 'settings/ou', 31, 31, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'settings/numberserie')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Number Sequencing', 'settings/numberserie', 31, 31, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'settings/namingtemplates')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'OSD Templates', 'settings/namingtemplates', 31, 31, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'softwaresources')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Software Sources', 'softwaresources', 31, 31, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'externalaccess')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'External Access', 'externalaccess', 16, 0, 0)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'users')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Users', 'users', 31, 1, 1)
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'devices')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SET @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Devices', 'devices', 31, 0, 0)
END

/* Get rid of strange duplicates. */
IF (SELECT Count(*) FROM SystemClass WHERE [Alias] = 'mdtrole') > 0
BEGIN
	SELECT @SystemClassID = (SELECT MIN(id) FROM SystemClass WHERE [Alias] = 'mdtrole')
	DELETE FROM SecurityClassPermission WHERE FK_SystemClassID = @SystemClassID
	DELETE FROM SystemClass WHERE ID = @SystemClassID
	IF (SELECT Count(*) FROM SystemClass WHERE [Alias] = 'mdtroles') < 1
	BEGIN
		INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
		VALUES(@SystemClassID, 'MDT Roles', 'mdtroles', 31, 31, 1)
	END
END

IF (SELECT Count(*) FROM SystemClass WHERE [Alias] = 'mdtroles') > 1
BEGIN
	SELECT @SystemClassID = (SELECT MIN(id) FROM SystemClass WHERE [Alias] = 'mdtroles')
	DELETE FROM SecurityClassPermission WHERE FK_SystemClassID = @SystemClassID
	DELETE FROM SystemClass WHERE ID = @SystemClassID
END

IF (SELECT Count(*) FROM SystemClass WHERE [Alias] = 'settings\ou') > 0
BEGIN
	SELECT @SystemClassID = (SELECT MIN(id) FROM SystemClass WHERE [Alias] = 'settings\ou')
	DELETE FROM SecurityClassPermission WHERE FK_SystemClassID = @SystemClassID
	DELETE FROM SystemClass WHERE ID = @SystemClassID
	INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
	VALUES(@SystemClassID, 'Organizational Units', 'settings/ou', 31, 31, 1)
END

IF (SELECT Count(*) FROM SystemClass WHERE [Alias] = 'externalaccess') > 1
BEGIN
	SELECT @SystemClassID = (SELECT MIN(id) FROM SystemClass WHERE [Alias] = 'externalaccess')
	DELETE FROM SystemClass WHERE ID = @SystemClassID
END
IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'computerview')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Computer Views', 'computerview', 1, 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'userview')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'User Views', 'userview', 1, 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'softwareview')
BEGIN
	SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Software Views', 'softwareview', 1, 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'reports')
BEGIN
  SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Reports', 'reports', 31, 31, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'packagedeploymenttemplate')
BEGIN
  SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Package Deployment Templates', 'packagedeploymenttemplate', 31, 31, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'applicationtemplate')
BEGIN
  SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Application Templates', 'applicationtemplate', 31, 31, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'tasksequencetemplate')
BEGIN
  SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Task Sequence Templates', 'tasksequencetemplate', 31, 31, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'applicationdeploymenttemplate')
BEGIN
  SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Application Deployment Templates', 'applicationdeploymenttemplate', 31, 31, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'packagetemplate')
BEGIN
  SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Package Templates', 'packagetemplate', 31, 31, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'tasksequencedeploymenttemplate')
BEGIN
  SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Task Sequence Deployment Templates', 'tasksequencedeploymenttemplate', 31, 31, 1)
END

IF NOT EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'announcements')
BEGIN
  SELECT @SystemClassID = MIN(id) FROM SystemClass
  SELECT @SystemClassID=@SystemClassID-1
  INSERT INTO SystemClass (ID, [Name], [Alias], [ClassPermissions], [InstancePermissions], [PagePermissions])
  VALUES(@SystemClassID, 'Announcements', 'announcements', 15, 0, 1)
END

/* Renames SystemClass Names */
IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'osd')
BEGIN
	UPDATE SystemClass SET [Name] = 'Computers' WHERE [Alias]= 'osd'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'packages')
BEGIN
	UPDATE SystemClass SET [Name] = 'Software' WHERE [Alias]= 'packages'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'softwareview')
BEGIN
	UPDATE SystemClass SET [Name] = 'Software Views' WHERE [Alias]= 'softwareview'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'softwareorder')
BEGIN
	UPDATE SystemClass SET [Name] = 'Software Order' WHERE [Alias]= 'softwareorder'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'settings/numberserie')
BEGIN
	UPDATE SystemClass SET [Name] = 'Number Sequencing' WHERE [Alias]= 'settings/numberserie'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'settings/namingtemplates')
BEGIN
	UPDATE SystemClass SET [Name] = 'OSD Templates' WHERE [Alias]= 'settings/namingtemplates'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'settings/ou')
BEGIN
	UPDATE SystemClass SET [Name] = 'Organizational Units' WHERE [Alias]= 'settings/ou'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'computerview')
BEGIN
	UPDATE SystemClass SET [Name] = 'Computer Views' WHERE [Alias]= 'computerview'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'userview')
BEGIN
	UPDATE SystemClass SET [Name] = 'User Views' WHERE [Alias]= 'userview'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'packagedeploymenttemplate')
BEGIN
	UPDATE SystemClass SET [Name] = 'Package Deployment Templates' WHERE [Alias]= 'packagedeploymenttemplate'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'applicationtemplate')
BEGIN
	UPDATE SystemClass SET [Name] = 'Application Templates' WHERE [Alias]= 'applicationtemplate'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'tasksequencetemplate')
BEGIN
	UPDATE SystemClass SET [Name] = 'Task Sequence Templates' WHERE [Alias]= 'tasksequencetemplate'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'applicationdeploymenttemplate')
BEGIN
	UPDATE SystemClass SET [Name] = 'Application Deployment Templates' WHERE [Alias]= 'applicationdeploymenttemplate'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'packagetemplate')
BEGIN
	UPDATE SystemClass SET [Name] = 'Package Templates' WHERE [Alias]= 'packagetemplate'
END

IF EXISTS (SELECT * FROM SystemClass WHERE [Alias] = 'tasksequencedeploymenttemplate')
BEGIN
	UPDATE SystemClass SET [Name] = 'Task Sequence Deployment Templates' WHERE [Alias]= 'tasksequencedeploymenttemplate'
END

/* Remove SystemClass items */
IF (SELECT Count(*) FROM SystemClass WHERE [Alias] = 'adcontainer') > 0
BEGIN
	SELECT @SystemClassID = (SELECT MIN(id) FROM SystemClass WHERE [Alias] = 'adcontainer')
	DELETE FROM SecurityClassPermission WHERE FK_SystemClassID = @SystemClassID
	DELETE FROM SystemClass WHERE ID = @SystemClassID
END
/* Readjust some values */
IF (SELECT ClassPermissions FROM SystemClass WHERE [Alias] = 'settings/namingtemplates') = 0
BEGIN
	UPDATE SystemClass SET [ClassPermissions] = 31, [InstancePermissions] = 31, [PagePermissions] = 1 WHERE [Alias]= 'settings/namingtemplates'
END
IF (SELECT ClassPermissions FROM SystemClass WHERE [Alias] = 'settings/numberserie') = 0
BEGIN
	UPDATE SystemClass SET [ClassPermissions] = 31, [InstancePermissions] = 31, [PagePermissions] = 1 WHERE [Alias]= 'settings/numberserie'
END
IF (SELECT ClassPermissions FROM SystemClass WHERE [Alias] = 'settings/ou') = 0
BEGIN
	UPDATE SystemClass SET [ClassPermissions] = 31, [InstancePermissions] = 31, [PagePermissions] = 1 WHERE [Alias]= 'settings/ou'
END
IF (SELECT ClassPermissions FROM SystemClass WHERE [Alias] = 'adcontainer') = 31
BEGIN
	UPDATE SystemClass SET [ClassPermissions] = 1, [InstancePermissions] = 0, [PagePermissions] = 1 WHERE [Alias]= 'adcontainer'
END
IF (SELECT ClassPermissions FROM SystemClass WHERE [Alias] = 'configmanager') = 31
BEGIN
	UPDATE SystemClass SET [ClassPermissions] = 0, [InstancePermissions] = 0, [PagePermissions] = 1 WHERE [Alias]= 'configmanager'
END
IF (SELECT ClassPermissions FROM SystemClass WHERE [Alias] = 'remotetools') = 1
BEGIN
	UPDATE SystemClass SET [ClassPermissions] = 0, [InstancePermissions] = 0, [PagePermissions] = 1 WHERE [Alias]= 'remotetools'
END
--IF (SELECT ClassPermissions FROM SystemClass WHERE [Alias] = 'distribution') = 0
--BEGIN
--	UPDATE SystemClass SET [ClassPermissions] = 31, [InstancePermissions] = 1, [PagePermissions] = 17 WHERE [Alias]= 'distribution'
--END
IF (SELECT InstancePermissions FROM SystemClass WHERE [Alias] = 'security') = 1
BEGIN
	UPDATE SystemClass SET [ClassPermissions] = 0, [InstancePermissions] = 0, [PagePermissions] = 1 WHERE [Alias]= 'security'
END
IF (SELECT InstancePermissions FROM SystemClass WHERE [Alias] = 'settings') = 0
BEGIN
	UPDATE SystemClass SET [ClassPermissions] = 0, [InstancePermissions] = 31, [PagePermissions] = 1 WHERE [Alias]= 'settings'
END
IF (SELECT InstancePermissions FROM SystemClass WHERE [Alias] = 'mdtroles') = 1
BEGIN
	UPDATE SystemClass SET [ClassPermissions] = 31, [InstancePermissions] = 31, [PagePermissions] = 1 WHERE [Alias]= 'mdtroles'
END

SET IDENTITY_INSERT SystemClass OFF
/*** [SYSTEMCLASS - END] ***/



/*** [SECURITYGROUP - BEGIN] ***/

IF (SELECT COUNT(*) FROM SecurityGroup) = 0 AND  (SELECT IDENT_CURRENT('SecurityGroup')) = 1
BEGIN
	INSERT INTO SecurityGroup ([Name], Roles) VALUES ('Portal Admins', '')
END

/*** [SECURITYGROUP - END] ***/

/*** [SYSTEMPAGE FIXES - BEGIN] ***/

IF(EXISTS (SELECT * FROM dbo.SystemPage WHERE Alias='role_create'))
BEGIN
	UPDATE dbo.SystemPage
	SET Alias = 'mdtrolecreate'
	WHERE Alias='role_create';
END
IF((SELECT COUNT(*) FROM dbo.SystemPage WHERE Alias='mdtrolecreate') > 1)
BEGIN
	DELETE FROM dbo.SecurityPagePermission WHERE [FK_SystemPageID] = (SELECT MIN(ID) FROM dbo.SystemPage WHERE Alias='mdtrolecreate');
	DELETE FROM dbo.SystemPage WHERE ID = (SELECT MIN(ID) FROM dbo.SystemPage WHERE Alias='mdtrolecreate');
END
IF(EXISTS (SELECT * FROM dbo.SystemPage WHERE Alias LIKE 'mdtrole%' AND FK_SystemClassID != (SELECT ID FROM dbo.SystemClass WHERE Alias = 'mdtroles')))
BEGIN
	UPDATE dbo.SystemPage
	SET FK_SystemClassID = (SELECT ID FROM dbo.SystemClass WHERE Alias = 'mdtroles')
	WHERE Alias LIKE'mdtrole%';
END
IF(EXISTS (SELECT * FROM dbo.SystemPage WHERE Alias='settingsosdou_addedit'))
BEGIN
	IF((SELECT ParentPageID FROM dbo.SystemPage WHERE Alias='settingsosdou_addedit') = (SELECT ID FROM dbo.SystemPage WHERE Alias='settingsosd'))
	BEGIN
		UPDATE dbo.SystemPage
		SET ParentPageID = (SELECT ID FROM dbo.SystemPage WHERE Alias='settingsosdou')
		WHERE Alias='settingsosdou_addedit';
	END
END
IF(EXISTS (SELECT * FROM dbo.SystemPage WHERE Alias='settingsosdou_addedit'))
BEGIN
	IF((SELECT Title FROM dbo.SystemPage WHERE Alias='settingsosdou_addedit') = 'Organizational Units')
	BEGIN
		UPDATE dbo.SystemPage
		SET Title = 'Organizational Units Add/Edit'
		WHERE Alias='settingsosdou_addedit';
	END
	IF((SELECT Hidden FROM dbo.SystemPage WHERE Alias='settingsosdou_addedit') = 0)
	BEGIN
		UPDATE dbo.SystemPage
		SET Hidden = 1
		WHERE Alias='settingsosdou_addedit';
	END
END
IF(EXISTS (SELECT * FROM dbo.SystemPage WHERE Alias='settingsosdtemplate_addedit'))
BEGIN
	IF((SELECT Title FROM dbo.SystemPage WHERE Alias='settingsosdtemplate_addedit') = 'Naming Templates')
	BEGIN
		UPDATE dbo.SystemPage
		SET Title = 'Naming Templates Add/Edit'
		WHERE Alias='settingsosdtemplate_addedit';
	END
	IF((SELECT Hidden FROM dbo.SystemPage WHERE Alias='settingsosdtemplate_addedit') = 0)
	BEGIN
		UPDATE dbo.SystemPage
		SET Hidden = 1
		WHERE Alias='settingsosdtemplate_addedit';
	END
END
IF(EXISTS (SELECT * FROM dbo.SystemPage WHERE Alias='settingsosdnumberserieaddedit'))
BEGIN
	IF((SELECT Title FROM dbo.SystemPage WHERE Alias='settingsosdnumberserieaddedit') = 'Number Series')
	BEGIN
		UPDATE dbo.SystemPage
		SET Title = 'Number Series Add/Edit'
		WHERE Alias='settingsosdnumberserieaddedit';
	END
	IF((SELECT Hidden FROM dbo.SystemPage WHERE Alias='settingsosdnumberserieaddedit') = 0)
	BEGIN
		UPDATE dbo.SystemPage
		SET Hidden = 1
		WHERE Alias='settingsosdnumberserieaddedit';
	END
END
/*** [SYSTEMPAGE FIXES - END] ***/



/*** [SYSTEMPAGE - BEGIN] ***/

SET IDENTITY_INSERT SystemPage ON

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'root')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=ISNULL(@SystemPageID,0)-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='system'
	SET @parentId = 0 --SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'root', '\default.aspx', 'Portal', 'Portal for Configuration Manager', '\gfx\icons\16x16\unknown.png', 0, 0)
END
IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packages')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='root'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packages', '\pages\packages\default.aspx', 'Packages', '', '\gfx\icons\16x16\packages.png', 8, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packagepublished')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packages'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packagepublished', '\pages\packages\publishedpackages.aspx', 'Published Packages', 'Lists the Software Packages that are published to Config Manager. Manage Package permissions and Distribution Point Assignments.', '\gfx\icons\16x16\published packages.png', 5, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settings')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='root'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settings', '\pages\settings\default.aspx', 'Settings', '', '\gfx\icons\16x16\settings.png', 20, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsgeneral')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsgeneral', '\pages\settings\general.aspx', 'General', 'Provide details for administrative email, localized formatting and database settings', '\gfx\icons\16x16\sqlserver.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingssecurity')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='security'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingssecurity', '\pages\settings\security.aspx', 'Security', 'Define the AD group that will have full access to Boost for Configuration Manager. Server Operators can view and manager servers.', '\gfx\icons\16x16\security.png', 18, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingssecuritygroup')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='security'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingssecurity'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingssecuritygroup', '\pages\settings\securitygroup.aspx', 'Security Groups', 'Lists and manage security groups that has different access to Boost for Configuration Manager.', '\gfx\icons\16x16\securitygroup.png', 8, 0)
END


IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'systempage')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='security'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingssecurity'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'systempage', '\pages\settings\systempage.aspx', 'System Pages', 'Organize and manage pages and their security within Boost. You can also add your own custom pages.', '\gfx\icons\16x16\systempage.png', 5, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'systemclass')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='security'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingssecurity'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'systemclass', '\pages\settings\systemclass.aspx', 'System Classes', 'Limit access to certain areas within Boost for Configuration Manager by defining permissions.', '\gfx\icons\16x16\systemclass.png', 6, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingssecuritypermission')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='security'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingssecurity'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingssecuritypermission', '\pages\settings\securitypermission.aspx', 'Permission Types', 'Permission Types are used by the security system to grant users access to classes, pages and items in Boost.', '\gfx\icons\16x16\permissiontypes.png', 10, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'eventlog')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='system'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='root'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'eventlog', '\pages\log\view.aspx', 'Events', 'View monitoring and troubleshooting messages from various Boost events.', '\gfx\icons\16x16\logs.png', 18, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'tasksequence')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packages'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'tasksequence', '\pages\tasksequence\tasksequence.aspx', 'Task Sequence', 'Lists the Task Sequences from Configuration Manager which Boost manages. Manage software packages, properties and permissions for the Task Sequences.', '\gfx\icons\16x16\task sequences.png', 10, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'tasksequencemanage')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='tasksequence'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'tasksequencemanage', '\pages\tasksequence\tasksequence_manage.aspx', 'Manage Task Sequence', 'View or edit properties for the Task Sequence.', '\gfx\icons\16x16\task sequences.png', 20, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packageedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packagepublished'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packageedit', '\pages\packages\package_addedit.aspx', 'Package', 'View or edit Software Package properties.', '\gfx\icons\16x16\package.png', 10, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packagesource')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packages'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packagesource', '\pages\packages\packagesource.aspx', 'Package Sources', 'Lists packages stored in selected Software Repository. Select packages and properties to publish the packages to Configuration Manager.', '\gfx\icons\16x16\sources.png', 0, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packageprepare')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packagesource'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packageprepare', '\pages\packages\newpackage.aspx', 'Prepare Package', 'Create a folder structure in the Software Repository for a new software package.', '\gfx\icons\16x16\prepare package.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packagenewprogram')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packagepublished'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packagenewprogram', '\pages\packages\program.aspx', 'New Program', 'Create an extra program for an existing package that is already published in Configuration Manager.', '\gfx\icons\16x16\new program.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packagereplicate')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packagepublished'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packagereplicate', '\pages\packages\replicate.aspx', 'Replicate Packages', 'Manage on which Distribution Points your packages resides. Packages can be added, refreshed or removed.', '\gfx\icons\16x16\replicate package.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packagenewpatch')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packagesource'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packagenewpatch', '\pages\packages\newpatch.aspx', 'Prepare Patch', 'Extend the Software Repository for an existing software package in order to append patches.', '\gfx\icons\16x16\prepare patch.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packagenewrelease')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packagesource'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packagenewrelease', '\pages\packages\newrelease.aspx', 'Prepare Release', 'Extend the Software Repository for an existing software package in order to make a new release.', '\gfx\icons\16x16\prepare package.png', 3, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'osd')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='osd'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='root'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'osd', '\pages\osd\default.aspx', 'OS Deployment', '', '\gfx\icons\16x16\os deployment.png', 4, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsconfigmgr')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsconfigmgr', '\pages\settings\configmgr.aspx', 'Configuration Manager', 'Provide details for the configuration Manager server, SDK integration paths and database settings.', '\gfx\icons\16x16\configmgr.png', 4, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsosd')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsosd', '\pages\settings\osd.aspx', 'OS Deployment', 'Provide settings for bar scanner usage, database settings and User State Migration paths.', '\gfx\icons\16x16\os deployment.png', 5, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingscollection')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingscollection', '\pages\settings\collection.aspx', 'Collections', 'Provide name for Configuration Manager collections used in Boost.', '\gfx\icons\16x16\collection.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingspackages')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingspackages', '\pages\settings\package.aspx', 'Packages', 'Configuration Manager specific package flags and settings.', '\gfx\icons\16x16\package.png', 3, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsprogram')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsprogram', '\pages\settings\program.aspx', 'Program', 'Program settings used during Software Package publishing. Command Line for Wrapper is also specified here.', '\gfx\icons\16x16\program.png', 4, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsadvertisement')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsadvertisement', '\pages\settings\advertisement.aspx', 'Advertisements', 'Configuration Manager specific advertisement flags and settings.', '\gfx\icons\16x16\advertisement.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingstaskseq')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingstaskseq', '\pages\settings\tasksequence.aspx', 'Task Sequences', 'Provide prefix and flags used when creating Task Sequences in Configuration Manager.', '\gfx\icons\16x16\task sequences.png', 5, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsosdtemplate')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings/namingtemplates'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsosd'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsosdtemplate', '\pages\settings\osdtemplate.aspx', 'Naming Templates', 'OSD Naming Templates for easy naming and registering of new computers.', '\gfx\icons\16x16\namingtemplate.png', 3, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsosdtemplate_addedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings/namingtemplates'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsosdtemplate'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsosdtemplate_addedit', '\pages\settings\osdtemplate_addedit.aspx', 'Naming Templates Add/Edit', 'OSD Naming Templates for easy naming and registering of new computers.', '\gfx\icons\16x16\namingtemplate.png', 3, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsosdou')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings/ou'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsosd'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsosdou', '\pages\settings\ou.aspx', 'Organizational Units', 'Provide LDAP details for Active Directory Organizational Units. Required by OS Deployment and Naming templates.', '\gfx\icons\16x16\ou.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsosdou_addedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings/ou'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsosdou'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsosdou_addedit', '\pages\settings\ou_addedit.aspx', 'Organizational Units Add/Edit', 'Provide LDAP details for Active Directory Organizational Units. Required by OS Deployment and Naming templates.', '\gfx\icons\16x16\ou.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsosdnumberserie')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings/numberserie'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsosd'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsosdnumberserie', '\pages\settings\osdnumberserie.aspx', 'Number Series', 'Create an number series for continuously name assignment of new computer. Used for Naming Templates.', '\gfx\icons\16x16\numberserie.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsosdnumberserieaddedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings/numberserie'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsosdnumberserie'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsosdnumberserieaddedit', '\pages\settings\osdnumberserie_addedit.aspx', 'Number Series Add/Edit', 'Create an number series for continuously name assignment of new computer. Used for Naming Templates.', '\gfx\icons\16x16\numberserie.png', 2, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'reporting')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='reports'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='root'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'reporting', '\pages\reports\list.aspx', 'Reports', 'Lists all your custom and predefined reports from Configuration Manager. The report will open in a new window.', '\gfx\icons\16x16\reports.png', 12, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'reportingadd')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='reports'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='reporting'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'reportingadd', '\pages\reports\report_add.aspx', 'Add Report', 'Links Configuration Manager reports to Boost database.', '\gfx\icons\16x16\reports.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'reportingview')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='reports'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='reporting'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'reportingview', '\pages\reports\view.aspx', 'View Report', 'View Configuration Manager report.', '\gfx\icons\16x16\reports.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingslicense')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingslicense', '\pages\settings\license.aspx', 'License', 'Your Boost license is stored here. Make sure its valid and not expires and fit the number of computers within your organization.', '\gfx\icons\16x16\license.png', 20, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsmodule')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsmodule', '\pages\settings\module.aspx', 'Boost Packs', 'Lists available Boost extension packs', '\gfx\icons\16x16\boost.png', 15, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingssoftwareorder')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsmodule'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingssoftwareorder', '\pages\settings\softwareorder.aspx', 'Software Order', 'Provide settings used for the Software Order Boost Pack.', '\gfx\icons\16x16\softwareorder.png', 6, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'softwareorder')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='softwareorder'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='root'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'softwareorder', '\pages\software order\list.aspx', 'Software Order', 'Lists Software Package installation orders from the users in your organization.', '\gfx\icons\16x16\softwareorder.png', 10, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'support')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='support'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='root'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'support', '\pages\support\default.aspx', 'Support', '', '\gfx\icons\16x16\support.png', 6, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'supportlogons')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='support'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='support'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'supportlogons', '\pages\support\logonassociations.aspx', 'Logon Associations', 'List computers based on the last logged on user, or list users who has been logged on a specific computer.', '\gfx\icons\16x16\user logons.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'supportremote')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='support'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='support'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'supportremote', '\pages\support\remotetools.aspx', 'Remote Tools', 'Assist users by remote controlling there computer.', '\gfx\icons\16x16\support.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'remotetools')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='remotetools'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsgeneral'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'remotetools', '\pages\settings\remotetools.aspx', 'Remote Tools', 'Manage Remote Tools and Remote Tools permissions.', '\gfx\icons\16x16\support.png', 1, 0)
END




IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsdomain')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsdomain', '\pages\settings\domain.aspx', 'Domains', 'Domains help Boost when looking up users in active directory and when connecting to computers.', '\gfx\icons\16x16\domains.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsadcontainers')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsdomain'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsadcontainers', '\pages\settings\adgroups.aspx', 'AD Containers', 'Set root AD OUs for use when using AD groups distribution.', '\gfx\icons\16x16\ou.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'softwareorderhistory')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='softwareorder'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='softwareorder'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'softwareorderhistory', '\pages\software order\history.aspx', 'History', 'Lists all processed Software Package installation orders with details about approval or rejection.', '\gfx\icons\16x16\softwareorder_history.png', 0, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'distribution')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='distribution'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='root'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'distribution', '\pages\distribution\default.aspx', 'Distribution', '', '\gfx\icons\16x16\distribution.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'swdeploy')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='distribution'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='distribution'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'swdeploy', '\pages\distribution\deploy.aspx', 'Software Deployment', 'Deploy Software to computers, users or groups', '\gfx\icons\16x16\deploysw.png', 3, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'swdeploywizard')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='distribution'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='swdeploy'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'swdeploywizard', '\pages\distribution\deploywizard.aspx', 'Software Deployment Wizard', '', '\gfx\icons\16x16\deploysw.png', 3, 1)
END


IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'viewinfo')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='distribution'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='distribution'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'viewinfo', '\pages\distribution\viewinfo.aspx', 'View Computer Info', 'View information about the selected computer.', '\gfx\icons\16x16\viewinfo.png', 4, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'softwareorderedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='softwareorder'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='softwareorder'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'softwareorderedit', '\pages\software order\order_edit.aspx', 'Edit Order', 'View the details for the Software Package installation order.', '\gfx\icons\16x16\package.png', 0, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'osdcomputer')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='osd'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='osd'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'osdcomputer', '\pages\osd\computer.aspx', 'Computers', 'Lists computers present in Microsoft Deployment Toolkit (MDT). Also indicates whether the computer is present in Config Manager.', '\gfx\icons\16x16\os deployment.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'osdcomputeredit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='osd'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='osdcomputer'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'osdcomputeredit', '\pages\osd\computer_edit.aspx', 'Edit Computer', 'Edit properties used when deploying this computer with MDT.', '\gfx\icons\16x16\os deployment.png', 2, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'distributionnew')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='distribution'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='distribution'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'distributionnew', '\pages\distribution\distribute.aspx', 'New Software Distribution', 'Add desired computers or users to the list, select packages and programs in order to start Software Distribution.', '\gfx\icons\16x16\new distribution.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'distributionclone')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='distribution'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='distribution'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'distributionclone', '\pages\distribution\clone.aspx', 'Clone', 'Select source and destination computer in order to clone Direct Membership Rules to the destination computer in ConfigMgr.', '\gfx\icons\16x16\clone resource.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'distributionclean')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='distribution'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='distribution'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'distributionclean', '\pages\distribution\clean.aspx', 'Clean', 'Remove Configuration Manager knowledge of distributed software. This does not necessarily start uninstallation jobs.', '\gfx\icons\16x16\clean resource.png', 3, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'osdcomputeradd')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='osd'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='osdcomputer'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'osdcomputeradd', '\pages\osd\computer_add.aspx', 'Create Computer', 'Select and fill in properties used when deploying this computer with MDT', '\gfx\icons\16x16\os deployment.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'osdreinstall')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='osd'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='osdcomputer'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'osdreinstall', '\pages\osd\reinstall.aspx', 'Reinstall OS', '', '\gfx\icons\16x16\os deployment.png', 3, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'mdtrole')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='mdtroles'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='osd'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'mdtrole', '\pages\osd\role.aspx', 'MDT Roles', 'Lists, adds or deleted Microsoft Deplyoment Tool (MDT) roles. Click Manage to assign software packages to the role.', '\gfx\icons\16x16\roles.png', 10, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'mdtrolemanage')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='mdtroles'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='mdtrole'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'mdtrolemanage', '\pages\osd\role_manage.aspx', 'Manage MDT Role', 'Manage the assigned software packages and associated programs for the role.', '\gfx\icons\16x16\roles.png', 0, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'mdtroleedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='mdtroles'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='mdtrole'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'mdtroleedit', '\pages\osd\role_edit.aspx', 'Edit MDT Role', 'Edit the name of the selected role.', '\gfx\icons\16x16\roles.png', 0, 1)
END


IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'mdtrolecreate')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='mdtroles'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='mdtrole'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'mdtrolecreate', '\pages\osd\role_create.aspx', 'Create MDT Role', 'Add a new role to the MDT database.', '\gfx\icons\16x16\roles.png', 0, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'osdimport')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='osd'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='osdcomputer'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'osdimport', '\pages\osd\import.aspx', 'Import', 'Import computers by supplying a text file with computer details. Details not specified in the text file can be specified directly on this page.', '\gfx\icons\16x16\os deployment.png', 4, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'osdimportvalidate')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='osd'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='osdimport'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'osdimportvalidate', '\pages\osd\importvalidate.aspx', 'Import Validation', '', '\gfx\icons\16x16\computers.png', 0, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'distributionscope')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='security'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingssecurity'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'distributionscope', '\pages\settings\distributionscope.aspx', 'Distribution Scopes', 'Segmenting the resources within your organization by creating Distribution Scopes. Users can be granted access to a scope to view exact resources.', '\gfx\icons\16x16\security.png', 3, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'distributionscopeedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='security'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='distributionscope'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'distributionscopeedit', '\pages\settings\distributionscope_addedit.aspx', 'Distribution Scope', '', '\gfx\icons\16x16\security.png', 0, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingssoftware')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingssoftware', '\pages\settings\software.aspx', 'Software', '', '\gfx\icons\16x16\packages.png', 12, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingscategory')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingssoftware'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingscategory', '\pages\settings\category.aspx', 'Categories', 'Define the Software Categories best suited for your organization.', '\gfx\icons\16x16\packages.png', 3, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsostype')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingssoftware'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsostype', '\pages\settings\operatingsystem.aspx', 'OS Types', 'Define the Operating Systems used in your organization.', '\gfx\icons\16x16\server.png', 4, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsrepositorylist')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingssoftware'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsrepositorylist', '\pages\settings\packageshares.aspx', 'Repositories', 'Software Repositories are the storage location where you can organize all your software packages by manufacture, version, language etc.', '\gfx\icons\16x16\repository.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsversioning')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingssoftware'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsversioning', '\pages\settings\folder.aspx', 'Versioning', 'Define versioning properties used when preparing Software Packages in the Software Repositories', '\gfx\icons\16x16\version.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingscategoryproperty')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingscategory'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingscategoryproperty', '\pages\settings\category_addedit.aspx', 'Category Properties', '', '\gfx\icons\16x16\package.png', 0, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'softwareplatforms')
BEGIN

	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM  SystemPage WHERE alias ='settingssoftware'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'softwareplatforms','\pages\settings\platforms.aspx','Processor Architecture','List and manage Processor Architecture Platforms.','\gfx\icons\16x16\cache.png',1,0,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packagemappings')
BEGIN

	SELECT @SystemPageID = MIN(ID) FROM  SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packagepublished'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'packagemappings','\pages\packages\PackageMapping.aspx','Package Mapping','Map software from Add/Remove to installable packages.','\gfx\icons\16x16\packagemapping.png',1,0,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsgroups')
BEGIN
	SELECT @SystemPageID = MIN(id) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'settingsgroups','\pages\groups\DepartmentGroups.aspx','Boost Groups','List and manage Boost Groups within your organization.','\gfx\icons\16x16\groups.png',1,0,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsgroups_addedit')
BEGIN
	SELECT @SystemPageID = MIN(id) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsgroups'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'settingsgroups_addedit','\pages\groups\DepartmentGroups_AddEdit.aspx','Manage Filter','Manage Boost Filtering for the group.','\gfx\icons\16x16\groups.png',1,1,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsservices')
BEGIN
	SELECT @SystemPageID = MIN(id) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'settingsservices','\pages\settings\BoostServices.aspx','Boost Services','Manage Boost Services.','\gfx\icons\16x16\services.png',7,0,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'cache')
BEGIN
	SELECT @SystemPageID = MIN(id) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'cache','\pages\settings\cache.aspx','Cache','Lists all objects saved in the application cache.','\gfx\icons\16x16\cache.png',19,0,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsservicestasks')
BEGIN
	SELECT @SystemPageID = MIN(id) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsservices'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'settingsservicestasks','\pages\settings\tasks.aspx','Tasks','Manage Boost Caching Service Tasks.','\gfx\icons\16x16\schedule-plan.png',1,0,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingssites')
BEGIN
	SELECT @SystemPageID = MIN(id) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'settingssites','\pages\settings\sites.aspx','Sites','Set options for Configuration Manager Sites.','\gfx\icons\16x16\domains.png',0,0,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'servicewindowcollection')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'servicewindowcollection', '\pages\servicewindow\collection.aspx', 'Service Windows', 'Manage Service Windows and Collections in SCCM.', '\gfx\icons\16x16\schedule-plan.png', 1, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'ServiceWindowCollections')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='servicewindowcollection'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'ServiceWindowCollections', '\pages\ServiceWindow\Collections.aspx', 'Service windows', 'Select service windows.', '\gfx\icons\16x16\meta.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'softwareorderlinkedgroups')
BEGIN
	SELECT @SystemPageID = MIN(id) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='softwareorder'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='softwareorder'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'softwareorderlinkedgroups','\pages\software order\LinkedDepartments.aspx','Software Order Linking','Manage links between Software Order enabled Software and Boost Groups.','\gfx\icons\16x16\software_group.png',1,0,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsviews')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsviews', '\pages\settings\computerview.aspx', 'Views', 'Manage views for your organization', '\gfx\icons\16x16\views.png', 19, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsviews_addedit')
BEGIN
	SELECT @SystemPageID = MIN(id) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsviews'

	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden], [CreatedDate])
	VALUES (@SystemPageID,@parentId,@SystemClassID,'settingsviews_addedit','\pages\settings\computerview_addedit.aspx','Manage View','Design the view and content for computers','\gfx\icons\16x16\view.png',1,1,getdate())
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'osdcomputerview')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='osd'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='osd'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'osdcomputerview', '\pages\lists\computers.aspx', 'Computers', 'View and manage computers', '\gfx\icons\16x16\monitor.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'userview_addedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsviews'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'userview_addedit', '\pages\settings\userview_addedit.aspx', 'Manage User View', 'Design the view and content for users', '\gfx\icons\16x16\users.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'deviceview_addedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsviews'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'deviceview_addedit', '\pages\settings\deviceview_addedit.aspx', 'Manage Device View', 'Design the view and content for devices', '\gfx\icons\16x16\device.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingscommence')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingscommence', '\pages\settings\commence.aspx', 'Commence', 'Settings for Boost Commence', '\gfx\icons\16x16\commence.png', 18, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'osdpreregister')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='osd'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='osdcomputer'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'osdpreregister', '\pages\osd\registercomputer.aspx', 'Pre-register computer', 'Pre-register computer for F12 boot with for Boost Commence', '\gfx\icons\16x16\preregister.png', 3, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingspublishingprofiles')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingspublishingprofiles', '\pages\settings\publishingprofiles.aspx', 'Publishing Profiles', 'Application Publishing Profiles', '\gfx\icons\16x16\publishprofiles.png', 8, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsaddpublishingprofile')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsconfigmgr'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsaddpublishingprofile', '\pages\settings\publishingprofile_addedit.aspx', 'Add Publishing Profile', 'Application Publishing Profile', '\gfx\icons\16x16\publishprofile.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'eventlogcleanup')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='system'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='eventlog'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'eventlogcleanup', '\pages\log\cleanup.aspx', 'Clean Up', 'Cleanup event log entries', '\gfx\icons\16x16\logs.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'packagepublish')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packages'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'packagepublish', '\pages\packages\publishpackages.aspx', 'Publish Packages', 'Published packages to Configuration Manager.', '\gfx\icons\16x16\published packages.png', 6, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'supersedence')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packages'
	INSERT INTO SystemPage 
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'supersedence', '\pages\packages\supersedence_addedit.aspx', 'Publish Packages', 'Published packages to Configuration Manager.', '\gfx\icons\16x16\published packages.png', 6, 1)
END


IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'userview')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='users'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='users'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'userview', '\pages\lists\users.aspx', 'Users', 'View and manage users', '\gfx\icons\16x16\users.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'deviceview')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='devices'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='devices'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'deviceview', '\pages\lists\devices.aspx', 'All Devices', 'View and manage devices', '\gfx\icons\16x16\device.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'softwareview')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='packages'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='packages'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'softwareview', '\pages\lists\software.aspx', 'Software', 'View and manage software', '\gfx\icons\16x16\sw.png', 2, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'importresources')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='distribution'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='distribution'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'importresources', '\pages\distribution\importresources.aspx', 'Import resources', 'Import resource selections from report or file.', '\gfx\icons\16x16\insert_column2_16.png', 5, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsoverviewgeneral')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsoverviewgeneral', '\pages\settings\generaloverview.aspx', 'General Overview', 'Overview', '\gfx\icons\16x16\views.png', 24, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsoverviewconfigmgr')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsoverviewconfigmgr', '\pages\settings\configmgroverview.aspx', 'Configuration Manager Overview', 'Overview', '\gfx\icons\16x16\views.png', 25, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsoverviewosd')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsoverviewosd', '\pages\settings\osdoverview.aspx', 'OSD Overview', 'Overview', '\gfx\icons\16x16\views.png', 26, 0)
END


IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsoverviewsoftware')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsoverviewsoftware', '\pages\settings\softwareoverview.aspx', 'Software Overview', 'Overview', '\gfx\icons\16x16\views.png', 27, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsoverviewservice')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsoverviewservice', '\pages\settings\serviceoverview.aspx', 'Service Overview', 'Overview', '\gfx\icons\16x16\views.png', 28, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsoverviewsecurity')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsoverviewsecurity', '\pages\settings\securityoverview.aspx', 'Security Overview', 'Overview', '\gfx\icons\16x16\views.png', 29, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsdetectionscripts')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsdetectionscripts', '\pages\settings\detectionscript.aspx', 'Detection Scripts', 'Deployment Type detection scripts', '\gfx\icons\16x16\script.png', 30, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsdetectionscripts_add')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsdetectionscripts'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsdetectionscripts_add', '\pages\settings\detectionscript_addedit.aspx', 'Add/Edit Detection Scripts', 'Deployment Type detection scripts', '\gfx\icons\16x16\script.png', 1, 1)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsdns')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settings'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsdns', '\pages\settings\dns.aspx', 'DNS', 'Registered DNS Servers', '\gfx\icons\16x16\dns.png', 31, 0)
END

IF NOT EXISTS (SELECT * FROM SystemPage WHERE [Alias] = 'settingsdns_addedit')
BEGIN
	SELECT @SystemPageID = MIN(ID) FROM SystemPage
	SET @SystemPageID=@SystemPageID-1
	SELECT @SystemClassID = ID FROM SystemClass WHERE Alias ='settings'
	SELECT @parentId = ID FROM SystemPage WHERE alias ='settingsdns'
	INSERT INTO SystemPage
	(ID, [ParentPageID], [FK_SystemClassID], [Alias], [SysFile], [Title], [Description], [Icon], [SortIndex], [Hidden])
	VALUES(@SystemPageID, @parentId, @SystemClassID, 'settingsdns_addedit', '\pages\settings\dns_addedit.aspx', 'Add DNS', 'Add/Edit registered DNS Server', '\gfx\icons\16x16\dns.png', 1, 1)
END


SET IDENTITY_INSERT SystemPage OFF
/*** [SYSTEMPAGE - END] ***/


/*** [SOFTWAREORDERSTRINGS - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'MasterPage' AND [StandardString] = 'Available Software' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'MasterPage', 'Available Software', 'Tilgængelig Software')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'MasterPage' AND [StandardString] = 'Installed Software' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'MasterPage', 'Installed Software', 'Installeret Software')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'MasterPage' AND [StandardString] = 'Help' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'MasterPage', 'Help', 'Hjælp')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Software' AND [StandardString] = 'Available Software' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Software', 'Available Software', 'Tilgængelig Software')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Software' AND [StandardString] = 'Error while populating tree. Description: ' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Software', 'Error while populating tree. Description: ', 'Fejl under udfyldning af træet. Beskrivelse: ')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Software' AND [StandardString] = 'An error occurred! Description: ' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Software', 'An error occurred! Description: ', 'Der skete en fejl! Beskrivelse: ')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Software' AND [StandardString] = 'Uncategorised' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Software', 'Uncategorised', 'Ukategoriserede')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Software' AND [StandardString] = 'Search' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Software', 'Search', 'Søg')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Software' AND [StandardString] = 'No' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Software', 'No', 'Ingen')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Software' AND [StandardString] = 'Installed Software' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Software', 'Installed Software', 'Installeret Software')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Software' AND [StandardString] = 'No software selected!' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Software', 'No software selected!', 'Ingen software valgt!')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Order' AND [StandardString] = 'No software selected!' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Order', 'No software selected!', 'Ingen software valgt!')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Order' AND [StandardString] = 'There was an unknown error while processing your order. Try again later or contact your software administrator if the problem persists.' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Order', 'There was an unknown error while processing your order. Try again later or contact your software administrator if the problem persists.', 'Der opstod en ukendt fejl under udførslen af din bestilling. Prøv igen senere eller kontakt din software administrator, hvis problemet varer ved.')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Order' AND [StandardString] = 'An error occurred while ordering software' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Order', 'An error occurred while ordering software', 'Der opstod en fejl med bestillingen af din software')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Order' AND [StandardString] = 'Uninstall' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Order', 'Uninstall', 'Afinstaller')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Order' AND [StandardString] = 'Reason for ordering' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Order', 'Reason for ordering', 'Begrundelse for bestilling')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Order' AND [StandardString] = 'Order' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Order', 'Order', 'Bestil')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Order' AND [StandardString] = 'Current order' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Order', 'Current order', 'Nuværende bestilling')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Default' AND [StandardString] = 'Exception caught. Unable to get IP Address from client.' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Default', 'Exception caught. Unable to get IP Address from client.', 'Undtagelse fanget. IP adressen kunne ikke hentes.')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Default' AND [StandardString] = 'You do not have access to the Software Order system using the current login. (' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Default', 'You do not have access to the Software Order system using the current login. (', 'Du har ikke adgang til Software Order systemet med det nuværende login. (')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Default' AND [StandardString] = 'Computer (' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Default', 'Computer (', 'Computeren')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Default' AND [StandardString] = ') cannot be found in Configuration Manager.' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Default', ') cannot be found in Configuration Manager.', ') kan ikke findes i Configuration Manager.')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Default' AND [StandardString] = ') is not a known Configuration Manager resource. General exception. ' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Default', ') is not a known Configuration Manager resource. General exception. ', ') er ikke en kendt Configuration Manager ressource. General undtagelse.')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Search' AND [StandardString] = 'Find Installed Software' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Search', 'Find Installed Software', 'Find Installeret Software')
END

IF NOT EXISTS (SELECT * FROM SoftwareOrderStrings WHERE [Page] = 'Search' AND [StandardString] = 'Find Available Software' AND [LCID] = 1030)
BEGIN
	INSERT INTO SoftwareOrderStrings VALUES(1030, 'Search', 'Find Available Software', 'Find Tilgængelig Software')
END

/*** [SOFTWAREORDERSTRINGS - END] ***/
/*** [MAILTEMPLATESTRINS - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'request' AND LCID = 1033 AND EnglishString = 'Hello')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('request',1033,'Hello','Hello')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'request' AND LCID = 1033 AND EnglishString = 'The following software has been ordered by')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('request',1033,'The following software has been ordered by','The following software has been ordered by')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'request' AND LCID = 1033 AND EnglishString = 'No description of software')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('request',1033,'No description of software','No description of software')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'request' AND LCID = 1033 AND EnglishString = 'No ordering reason specified by user')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('request',1033,'No ordering reason specified by user','No ordering reason specified by user')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'request' AND LCID = 1033 AND EnglishString = 'Software description')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('request',1033,'Software description','Software description')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'request' AND LCID = 1033 AND EnglishString = 'Approve/Decline Orders')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('request',1033,'Approve/Decline Orders','Approve/Decline Orders')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'request' AND LCID = 1033 AND EnglishString = '%MailSubject%')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('request',1033,'%MailSubject%','New Software Order Request')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'status' AND LCID = 1033 AND EnglishString = 'Hello')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('status',1033,'Hello','Hello')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'status' AND LCID = 1033 AND EnglishString = 'Your software order has been handled')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('status',1033,'Your software order has been handled','Your software order has been handled')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'status' AND LCID = 1033 AND EnglishString = 'The status of each software request are listed below')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('status',1033,'The status of each software request are listed below','The status of each software request are listed below')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'status' AND LCID = 1033 AND EnglishString = 'Ordered Software')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('status',1033,'Ordered Software','Ordered Software')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'status' AND LCID = 1033 AND EnglishString = 'Rejected')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('status',1033,'Rejected','Rejected')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'status' AND LCID = 1033 AND EnglishString = 'Approved')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('status',1033,'Approved','Approved')
END
IF NOT EXISTS (SELECT * FROM [dbo].[MailTemplateString] WHERE [Type] = 'status' AND LCID = 1033 AND EnglishString = '%MailSubject%')
BEGIN
  INSERT INTO [dbo].[MailTemplateString] ([Type],LCID,EnglishString,LocalizedString)
    VALUES ('status',1033,'%MailSubject%','Software Order Approval Status')
END
/*** [MAILTEMPLATESTRINS - END] ***/

IF NOT EXISTS (SELECT * FROM [dbo].[CachingServiceSyncSchedule] WHERE [SyncType] = 'Computer')
BEGIN
  INSERT [dbo].[CachingServiceSyncSchedule] ([Enabled], [SyncType], [IntervalType], [Interval]) 
	VALUES (1, N'Computer', N'minutes', 10)   
END

IF NOT EXISTS (SELECT * FROM [dbo].[CachingServiceSyncSchedule] WHERE [SyncType] = 'User')
BEGIN
  INSERT [dbo].[CachingServiceSyncSchedule] ([Enabled], [SyncType], [IntervalType], [Interval]) 
	VALUES (1, N'User', N'minutes', 20)   
END

IF NOT EXISTS (SELECT * FROM [dbo].[CachingServiceSyncSchedule] WHERE [SyncType] = 'Group')
BEGIN
  INSERT [dbo].[CachingServiceSyncSchedule] ([Enabled], [SyncType], [IntervalType], [Interval]) 
	VALUES (1, N'Group', N'hours', 1)   
END

IF NOT EXISTS (SELECT * FROM [dbo].[CachingServiceSyncSchedule] WHERE [SyncType] = 'Software')
BEGIN
  INSERT [dbo].[CachingServiceSyncSchedule] ([Enabled], [SyncType], [IntervalType], [Interval]) 
	VALUES (1, N'Software', N'hours', 24)   
END

IF NOT EXISTS (SELECT * FROM [dbo].[CachingServiceSyncSchedule] WHERE [SyncType] = 'DeploymentScope')
BEGIN
  INSERT [dbo].[CachingServiceSyncSchedule] ([Enabled], [SyncType], [IntervalType], [Interval]) 
	VALUES (1, N'DeploymentScope', N'hours', 4)   
END


/*** [BOOST TASKS SCHEDULES - END] ***/

/*** [BOOST GROUPS - BEGIN] ***/
IF NOT EXISTS (SELECT 1 FROM Department)
BEGIN
  INSERT INTO Department (Name,[Type],Parent) VALUES ('Portal Groups',0,NULL)
END
/*** [BOOST GROUPS - END] ***/

/*** [Computer DEFAULT VIEW - BEGIN] ***/
IF(SELECT COUNT(*) FROM [dbo].[ComputerView]) = 0
BEGIN
	INSERT INTO [dbo].[Filter] ([Name], [Expression]) VALUES ('ComputerView_1','AAEAAAD/////AQAAAAAAAAAQAQAAAAMAAAAKCQIAAAAJAwAAABACAAAABAAAAAkEAAAACQUAAAAJBgAAAAkHAAAADAgAAABXVGVsZXJpay5XZWIuVUksIFZlcnNpb249MjAxNC4xLjQwMy40MCwgQ3VsdHVyZT1uZXV0cmFsLCBQdWJsaWNLZXlUb2tlbj0xMjFmYWU3ODE2NWJhM2Q0BQMAAAAmVGVsZXJpay5XZWIuVUkuUmFkRmlsdGVyR3JvdXBPcGVyYXRpb24BAAAAB3ZhbHVlX18ACAgAAAAAAAAADAkAAABNU3lzdGVtLldlYiwgVmVyc2lvbj00LjAuMC4wLCBDdWx0dXJlPW5ldXRyYWwsIFB1YmxpY0tleVRva2VuPWIwM2Y1ZjdmMTFkNTBhM2EFBAAAABJTeXN0ZW0uV2ViLlVJLlBhaXICAAAABUZpcnN0BlNlY29uZAICCQAAAAgIAwAAAAgIAAAAAAEFAAAABAAAAAkKAAAACQsAAAABBgAAAAQAAAAJDAAAAAkNAAAAAQcAAAAEAAAACQ4AAAAJDwAAAAEKAAAABAAAAAYQAAAAIlJhZEZpbHRlckVxdWFsVG9GaWx0ZXJFeHByZXNzaW9uYDEGEQAAAA5TeXN0ZW0uQm9vbGVhbhALAAAAAgAAAAkSAAAABhMAAAAGQWN0aXZlAQwAAAAEAAAABhQAAAAiUmFkRmlsdGVyTm90SXNOdWxsRmlsdGVyRXhwcmVzc2lvbgYVAAAADVN5c3RlbS5PYmplY3QQDQAAAAIAAAAKBhYAAAAFTWR0SUQBDgAAAAQAAAAGFwAAACNSYWRGaWx0ZXJOb3RJc0VtcHR5RmlsdGVyRXhwcmVzc2lvbgYYAAAADVN5c3RlbS5TdHJpbmcQDwAAAAIAAAAKBhkAAAAKUmVzb3VyY2VJRAQSAAAAHFN5c3RlbS5Db2xsZWN0aW9ucy5BcnJheUxpc3QDAAAABl9pdGVtcwVfc2l6ZQhfdmVyc2lvbgUAAAgICRoAAAACAAAAAgAAABAaAAAABAAAAAkbAAAACAEBDQIFGwAAABtTeXN0ZW0uV2ViLlVJLkluZGV4ZWRTdHJpbmcBAAAABl92YWx1ZQEJAAAABhwAAAAFVmFsdWUL')
	INSERT INTO [dbo].[GridColumnData](	[Key],	[ColumnData]) VALUES ( 'C4DBED10-3090-4C2D-B3B1-9321E1BB7212', '<?xml version="1.0"?>  <ArrayOfRadControlState xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">    <RadControlState>      <ControlSettings />      <UniqueId>Telerik.Web.UI_PersistanceManager_CustomSettings</UniqueId>    </RadControlState>    <RadControlState>      <ControlSettings>        <ControlSetting>          <Name>CurrentPageIndex</Name>          <Value Type="System.Int32">            <int>0</int>          </Value>        </ControlSetting>        <ControlSetting>          <Name>EditIndexes</Name>          <Value Type="Telerik.Web.UI.GridIndexCollection">            <GridIndexCollection>              <Data />            </GridIndexCollection>          </Value>        </ControlSetting>        <ControlSetting>          <Name>PageSize</Name>          <Value Type="System.Int32">            <int>30</int>          </Value>        </ControlSetting>        <ControlSetting>          <Name>SelectedCellIndexes</Name>          <Value Type="Telerik.Web.UI.GridIndexCollection">            <GridIndexCollection>              <Data />            </GridIndexCollection>          </Value>        </ControlSetting>        <ControlSetting>          <Name>SelectedIndexes</Name>          <Value Type="Telerik.Web.UI.GridIndexCollection">            <GridIndexCollection>              <Data />            </GridIndexCollection>          </Value>        </ControlSetting>        <ControlSetting>          <Name>Width</Name>          <Value Type="System.Web.UI.WebControls.Unit">            <Unit>1024px</Unit>          </Value>        </ControlSetting>        <ControlSetting>          <Name>MasterTableView.Width</Name>          <Value Type="System.Web.UI.WebControls.Unit">            <Unit />          </Value>        </ControlSetting>        <ControlSetting>          <Name>MasterTableView.FilterExpression</Name>          <Value Type="System.String">            <string />          </Value>        </ControlSetting>        <ControlSetting>          <Name>MasterTableView.PageSize</Name>          <Value Type="System.Int32">            <int>30</int>          </Value>        </ControlSetting>        <ControlSetting>          <Name>MasterTableView.ColumnSettings</Name>          <Value Type="System.Collections.Generic.List`1[[Telerik.Web.UI.GridTableView+PersistableColumnSetting, Telerik.Web.UI]]">            <ArrayOfPersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>ExpandColumn</UniqueName>                <Visible>false</Visible>                <Display>true</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>-1</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>20px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>RowIndicator</UniqueName>                <Visible>false</Visible>                <Display>true</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>-1</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>20px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>name</UniqueName>                <Visible>true</Visible>                <Display>true</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>2</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>100px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>state</UniqueName>                <Visible>true</Visible>                <Display>true</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>3</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>80px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>OS</UniqueName>                <Visible>true</Visible>                <Display>true</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>4</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>130px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>Domain</UniqueName>                <Visible>true</Visible>                <Display>true</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>5</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>100px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>primaryUser</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>6</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>100px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>macAddress</UniqueName>                <Visible>true</Visible>                <Display>true</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>7</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>130px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>MDTMacAddress</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>8</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>130px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>smbios</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>9</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>180px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>MDTsmbios</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>10</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>180px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>SiteCode</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>11</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>70px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>ResourceID</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>12</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>70px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>CMCreationDate</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>13</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>100px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>Obsolete</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>14</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>60px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>Active</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>15</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>60px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>LastLogonTime</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>16</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>130px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>IsVirtualMachine</UniqueName>                <Visible>true</Visible>                <Display>true</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>17</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>60px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>VirtualMachineHostName</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>18</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>100px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>CMUniqueIdentifier</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>19</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>130px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>MdtID</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>20</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>70px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>MDTOU</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>21</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>130px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>CMDecommissioned</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>22</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>60px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>WTGUniqueKey</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>23</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>80px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>Number</UniqueName>                <Visible>true</Visible>                <Display>false</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>24</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>80px</Width>              </PersistableColumnSetting>              <PersistableColumnSetting>                <UniqueName>CMPresent</UniqueName>                <Visible>true</Visible>                <Display>true</Display>                <SortExpression />                <GroupByExpression />                <OrderIndex>24</OrderIndex>                <CurrentFilterFunction>NoFilter</CurrentFilterFunction>                <CurrentFilterValue />                <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction>                <AndCurrentFilterValue />                <Width>80px</Width>              </PersistableColumnSetting>            </ArrayOfPersistableColumnSetting>          </Value>        </ControlSetting>        <ControlSetting>          <Name>MasterTableView.SortExpressions</Name>          <Value Type="Telerik.Web.UI.GridSortExpressionCollection">            <ArrayOfGridSortExpression />          </Value>        </ControlSetting>        <ControlSetting>          <Name>MasterTableView.GroupByExpressions</Name>          <Value Type="Telerik.Web.UI.GridGroupByExpressionCollection">            <ArrayOfGridGroupByExpression />          </Value>        </ControlSetting>        <ControlSetting>          <Name>MasterTableView.CurrentPageIndex</Name>          <Value Type="System.Int32">            <int>0</int>          </Value>        </ControlSetting>        <ControlSetting>          <Name>MasterTableView.IsItemInserted</Name>          <Value Type="System.Boolean">            <boolean>false</boolean>          </Value>        </ControlSetting>      </ControlSettings>      <UniqueId>ctl00$Content$RadGridComputers</UniqueId>      <UniqueKey />    </RadControlState>  </ArrayOfRadControlState>')
	INSERT INTO [dbo].[ComputerView](	[Name],	[Description],	[FK_FilterID],	[ColumnDataKey]) VALUES ('Standard Computer View', 'Default', (SELECT TOP 1 ID FROM [dbo].[Filter] WHERE Name = 'ComputerView_1'), 'C4DBED10-3090-4C2D-B3B1-9321E1BB7212')
END
/*** [Computer DEFAULT VIEW - END] ***/

/*** [User DEFAULT VIEW - BEGIN] ***/
IF(SELECT COUNT(*) FROM [dbo].[UserView]) = 0
BEGIN
	INSERT INTO [dbo].[Filter] ([Name], [Expression]) VALUES ('UserView_1','AAEAAAD/////AQAAAAAAAAAQAQAAAAMAAAANAgkCAAAADAMAAABYVGVsZXJpay5XZWIuVUksIFZlcnNpb249MjAxNC4zLjEwMjQuNDAsIEN1bHR1cmU9bmV1dHJhbCwgUHVibGljS2V5VG9rZW49MTIxZmFlNzgxNjViYTNkNAUCAAAAJlRlbGVyaWsuV2ViLlVJLlJhZEZpbHRlckdyb3VwT3BlcmF0aW9uAQAAAAd2YWx1ZV9fAAgDAAAAAAAAAAs=')
	INSERT INTO [dbo].[GridColumnData](	[Key],	[ColumnData]) VALUES ( '2915E9C9-B794-456E-9B5C-D613CC6EF935', '<?xml version="1.0"?> <ArrayOfRadControlState xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"> <RadControlState> <ControlSettings /> <UniqueId>Telerik.Web.UI_PersistanceManager_CustomSettings</UniqueId> </RadControlState> <RadControlState> <ControlSettings> <ControlSetting> <Name>CurrentPageIndex</Name> <Value Type="System.Int32"> <int>0</int> </Value> </ControlSetting> <ControlSetting> <Name>EditIndexes</Name> <Value Type="Telerik.Web.UI.GridIndexCollection"> <GridIndexCollection> <Data /> </GridIndexCollection> </Value> </ControlSetting> <ControlSetting> <Name>PageSize</Name> <Value Type="System.Int32"> <int>30</int> </Value> </ControlSetting> <ControlSetting> <Name>SelectedCellIndexes</Name> <Value Type="Telerik.Web.UI.GridIndexCollection"> <GridIndexCollection> <Data /> </GridIndexCollection> </Value> </ControlSetting> <ControlSetting> <Name>SelectedIndexes</Name> <Value Type="Telerik.Web.UI.GridIndexCollection"> <GridIndexCollection> <Data /> </GridIndexCollection> </Value> </ControlSetting> <ControlSetting> <Name>Width</Name> <Value Type="System.Web.UI.WebControls.Unit"> <Unit>1024px</Unit> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.Width</Name> <Value Type="System.Web.UI.WebControls.Unit"> <Unit>861px</Unit> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.FilterExpression</Name> <Value Type="System.String"> <string /> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.PageSize</Name> <Value Type="System.Int32"> <int>30</int> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.ColumnSettings</Name> <Value Type="System.Collections.Generic.List`1[[Telerik.Web.UI.GridTableView+PersistableColumnSetting, Telerik.Web.UI]]"> <ArrayOfPersistableColumnSetting> <PersistableColumnSetting> <UniqueName>ExpandColumn</UniqueName> <Visible>false</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>-1</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>20px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>RowIndicator</UniqueName> <Visible>false</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>-1</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>20px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>ResourceID</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>2</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width /> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>Name</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>3</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>180px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>FullName</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>4</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>272px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>Mail</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>5</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>100px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>Domain</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>6</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>120px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>UPN</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>7</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>189px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>SID</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>8</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>120px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>CloudUserID</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>9</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>80px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>DistinguisedName</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>10</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>80px</Width> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>UniqueName</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>11</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>80px</Width> </PersistableColumnSetting> </ArrayOfPersistableColumnSetting> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.SortExpressions</Name> <Value Type="Telerik.Web.UI.GridSortExpressionCollection"> <ArrayOfGridSortExpression /> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.GroupByExpressions</Name> <Value Type="Telerik.Web.UI.GridGroupByExpressionCollection"> <ArrayOfGridGroupByExpression /> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.CurrentPageIndex</Name> <Value Type="System.Int32"> <int>0</int> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.IsItemInserted</Name> <Value Type="System.Boolean"> <boolean>false</boolean> </Value> </ControlSetting> </ControlSettings> <UniqueId>ctl00$Content$RadGridUsers</UniqueId> <UniqueKey /> </RadControlState> </ArrayOfRadControlState>')
	INSERT INTO [dbo].[UserView](	[Name],	[Description],	[FK_FilterID],	[ColumnDataKey]) VALUES ('Standard User View', 'Default', (SELECT TOP 1 ID FROM [dbo].[Filter] WHERE Name = 'UserView_1'), '2915E9C9-B794-456E-9B5C-D613CC6EF935')
END
/*** [User DEFAULT VIEW - END] ***/

/*** [Software DEFAULT VIEW - BEGIN] ***/
IF(SELECT COUNT(*) FROM [dbo].[SoftwareView]) = 0
BEGIN
	INSERT INTO [dbo].[Filter] ([Name], [Expression]) VALUES ('SoftwareView_1','AAEAAAD/////AQAAAAAAAAAQAQAAAAMAAAANAgkCAAAADAMAAABXVGVsZXJpay5XZWIuVUksIFZlcnNpb249MjAxNi4zLjkxNC40MCwgQ3VsdHVyZT1uZXV0cmFsLCBQdWJsaWNLZXlUb2tlbj0xMjFmYWU3ODE2NWJhM2Q0BQIAAAAmVGVsZXJpay5XZWIuVUkuUmFkRmlsdGVyR3JvdXBPcGVyYXRpb24BAAAAB3ZhbHVlX18ACAMAAAAAAAAACw==')
	INSERT INTO [dbo].[GridColumnData](	[Key],	[ColumnData]) VALUES ( 'A404F4BD-D368-4251-9DB9-B3E2A44D47D6', '<?xml version="1.0"?> <ArrayOfRadControlState xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"> <RadControlState> <ControlSettings /> <UniqueId>Telerik.Web.UI_PersistanceManager_CustomSettings</UniqueId> </RadControlState> <RadControlState> <ControlSettings> <ControlSetting> <Name>CurrentPageIndex</Name> <Value Type="System.Int32"> <int>0</int> </Value> </ControlSetting> <ControlSetting> <Name>EditIndexes</Name> <Value Type="Telerik.Web.UI.GridIndexCollection"> <GridIndexCollection> <Data /> </GridIndexCollection> </Value> </ControlSetting> <ControlSetting> <Name>PageSize</Name> <Value Type="System.Int32"> <int>30</int> </Value> </ControlSetting> <ControlSetting> <Name>SelectedCellIndexes</Name> <Value Type="Telerik.Web.UI.GridIndexCollection"> <GridIndexCollection> <Data /> </GridIndexCollection> </Value> </ControlSetting> <ControlSetting> <Name>SelectedIndexes</Name> <Value Type="Telerik.Web.UI.GridIndexCollection"> <GridIndexCollection> <Data /> </GridIndexCollection> </Value> </ControlSetting> <ControlSetting> <Name>Width</Name> <Value Type="System.Web.UI.WebControls.Unit"> <Unit>100%</Unit> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.Width</Name> <Value Type="System.Web.UI.WebControls.Unit"> <Unit>1110px</Unit> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.FilterExpression</Name> <Value Type="System.String"> <string /> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.PageSize</Name> <Value Type="System.Int32"> <int>30</int> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.ColumnSettings</Name> <Value Type="System.Collections.Generic.List`1[[Telerik.Web.UI.GridTableView+PersistableColumnSetting, Telerik.Web.UI]]"> <ArrayOfPersistableColumnSetting> <PersistableColumnSetting> <UniqueName>ExpandColumn</UniqueName> <Visible>false</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>-1</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>20px</Width> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>RowIndicator</UniqueName> <Visible>false</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>-1</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>20px</Width> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>ID</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>2</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width /> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>PackageID</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>3</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width /> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>Manufacturer</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>4</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width /> <Aggregate>Count</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>Name</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>5</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width /> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>ShortName</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>6</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width /> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>Version</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>7</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>85px</Width> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>Language</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>8</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>150px</Width> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>PackageType</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>9</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width /> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>Price</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>10</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>85px</Width> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>Owner</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>11</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width /> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>IsSuperseded</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>12</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>80px</Width> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>IsSuperseding</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>13</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>80px</Width> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>IsExpired</UniqueName> <Visible>true</Visible> <Display>false</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>14</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>80px</Width> <Aggregate>None</Aggregate> </PersistableColumnSetting> <PersistableColumnSetting> <UniqueName>DP</UniqueName> <Visible>true</Visible> <Display>true</Display> <SortExpression /> <GroupByExpression /> <OrderIndex>15</OrderIndex> <CurrentFilterFunction>NoFilter</CurrentFilterFunction> <CurrentFilterValue /> <AndCurrentFilterFunction>NoFilter</AndCurrentFilterFunction> <AndCurrentFilterValue /> <Width>80px</Width> <Aggregate>None</Aggregate> </PersistableColumnSetting> </ArrayOfPersistableColumnSetting> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.SortExpressions</Name> <Value Type="Telerik.Web.UI.GridSortExpressionCollection"> <ArrayOfGridSortExpression /> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.GroupByExpressions</Name> <Value Type="Telerik.Web.UI.GridGroupByExpressionCollection"> <ArrayOfGridGroupByExpression /> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.CurrentPageIndex</Name> <Value Type="System.Int32"> <int>0</int> </Value> </ControlSetting> <ControlSetting> <Name>MasterTableView.IsItemInserted</Name> <Value Type="System.Boolean"> <boolean>false</boolean> </Value> </ControlSetting> </ControlSettings> <UniqueId>ctl00$Content$RadGridSoftware</UniqueId> <UniqueKey /> </RadControlState> </ArrayOfRadControlState>')
	INSERT INTO [dbo].[SoftwareView](	[Name],	[Description],	[FK_FilterID],	[ColumnDataKey]) VALUES ('Standard Software View', 'Default', (SELECT TOP 1 ID FROM [dbo].[Filter] WHERE Name = 'SoftwareView_1'), 'A404F4BD-D368-4251-9DB9-B3E2A44D47D6')
END
/*** [Software DEFAULT VIEW - END] ***/


/*** PageAreas ***/
IF NOT EXISTS (SELECT * FROM PageArea WHERE [AreaType] = 'Browse')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(0, 'Browse', 'BrowseRoot', 'Browse', 100)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [AreaType] = 'New')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(0, 'New', 'NewRoot', 'New', 500)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [AreaType] = 'Settings')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(0, 'Settings', 'SettingsRoot', 'Settings', 1000)
END

DECLARE @BrowseRootID int = (SELECT ID FROM PageArea WHERE Area = 'BrowseRoot')
DECLARE @NewRootID int = (SELECT ID FROM PageArea WHERE Area = 'NewRoot')
DECLARE @SettingsRootID int = (SELECT ID FROM PageArea WHERE Area = 'SettingsRoot')

--Browse Menu
IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseComputers')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseComputers', 'Computers', 110)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseUsers')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseUsers', 'Users', 120)
END

--IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseDevices')
--BEGIN
--  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseDevices', 'Devices', 130)
--END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseSoftware')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseSoftware', 'Software', 140)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseMDTRoles')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseMDTRoles', 'MDT Roles', 150)
END
IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseTS')

BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseTS', 'Task Sequences', 160)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseEventlog')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseEventlog', 'Events', 170)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseDashboard')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseDashboard', 'Dashboard', 180)
END

--IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseSoftwareOrder')
--BEGIN
--  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseSoftwareOrder', 'Software Order', 180)
--END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseDeployments')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseDeployments', 'Software Deployments', 190)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseReports')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseReports', 'Reports', 200)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'BrowseAnnouncements')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@BrowseRootID, 'Browse', 'BrowseAnnouncements', 'Announcements', 210)
END

--New Menu
IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewAddComputer')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@NewRootID, 'New', 'NewAddComputer', 'Computer', 510)
END
ELSE
BEGIN
  UPDATE PageArea
  SET [Position] = 510
  WHERE [Area] = 'NewAddComputer'
END

DECLARE @New_ComputerRootID int = (SELECT ID FROM PageArea WHERE Area = 'NewAddComputer')

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewPreRegisterComputer')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@New_ComputerRootID, 'NewAddComputer', 'NewPreRegisterComputer', 'Pre-Register Computer', 510)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewImportComputer')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@New_ComputerRootID, 'NewAddComputer', 'NewImportComputer', 'Import Computer', 510)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewDeploySW')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@NewRootID, 'New', 'NewDeploySW', 'Software Deployment', 520)
END
ELSE
BEGIN
  UPDATE PageArea
  SET [Position] = 520
  WHERE [Area] = 'NewDeploySW'
END

DECLARE @New_SoftwareDeployRootID int = (SELECT ID FROM PageArea WHERE Area = 'NewDeploySW')

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewDeploySWFull')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@New_SoftwareDeployRootID, 'NewDeploySW', 'NewDeploySWFull', 'Standard Software Deployment', 1)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewDeploySWQuick')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@New_SoftwareDeployRootID, 'NewDeploySW', 'NewDeploySWQuick', 'Quick Software Deployment', 1)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewSW')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@NewRootID, 'New', 'NewSW', 'Software', 530)
END

DECLARE @New_SoftwareRootID int = (SELECT ID FROM PageArea WHERE Area = 'NewSW')

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewPublish')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@New_SoftwareRootID, 'NewSW', 'NewPublish', 'Software Application', 530)
END
ELSE
BEGIN
  UPDATE PageArea
  SET [ParentArea] = @New_SoftwareRootID, [AreaType] = 'NewSW', [Description] = 'Application', [Position] = 530
  WHERE [Area] = 'NewPublish'
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewAddPackage')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@New_SoftwareRootID, 'NewSW', 'NewAddPackage', 'Software Package', 530)
END
ELSE
BEGIN
  UPDATE PageArea
  SET [ParentArea] = @New_SoftwareRootID, [AreaType] = 'NewSW', [Description] = 'Package'
  WHERE [Area] = 'NewAddPackage'
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewTS')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@NewRootID, 'New', 'NewTS', 'Task Sequence', 540)
END
ELSE
BEGIN
  UPDATE PageArea
  SET [Position] = 540
  WHERE [Area] = 'NewTS'
END

DECLARE @New_TaskSequenceRootID int = (SELECT ID FROM PageArea WHERE Area = 'NewTS')

--IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewGenericTaskSequence')
--BEGIN
--  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@New_TaskSequenceRootID, 'NewTS', 'NewGenericTaskSequence', 'New Generic Task Sequence', 540)
--END
--ELSE
--BEGIN
--  UPDATE PageArea
--  SET [Position] = 540
--  WHERE [Area] = 'NewGenericTaskSequence'
--END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewSoftwareTaskSequence')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@New_TaskSequenceRootID, 'NewTS', 'NewSoftwareTaskSequence', 'New Software Task Sequence', 540)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewOSDTaskSequence')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@New_TaskSequenceRootID, 'NewTS', 'NewOSDTaskSequence', 'New OSD Task Sequence', 540)
END
ELSE
BEGIN
  UPDATE PageArea
  SET [Position] = 540
  WHERE [Area] = 'NewOSDTaskSequence'
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewMDTRoles')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@NewRootID, 'New', 'NewMDTRoles', 'MDT Role', 550)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewReports')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@NewRootID, 'New', 'NewReports', 'Report', 560)
END
ELSE
BEGIN
  UPDATE PageArea
  SET [Position] = 560
  WHERE [Area] = 'NewReports'
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'NewAnnouncement')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@NewRootID, 'New', 'NewAnnouncement', 'Announcement', 570)
END


--Settings Menu
IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsGeneral')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@SettingsRootID, 'Settings', 'SettingsGeneral', 'General', 1010)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsConfigMgr')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@SettingsRootID, 'Settings', 'SettingsConfigMgr', 'Configuration Manager', 1020)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsOSD')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@SettingsRootID, 'Settings', 'SettingsOSD', 'OS Deployment', 1030)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsSoftware')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@SettingsRootID, 'Settings', 'SettingsSoftware', 'Software', 1040)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsServices')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@SettingsRootID, 'Settings', 'SettingsServices', 'Services', 1050)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsSecurity')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@SettingsRootID, 'Settings', 'SettingsSecurity', 'Security', 1060)
END

DECLARE @Settings_GeneralRootID int = (SELECT ID FROM PageArea WHERE Area = 'SettingsGeneral')
DECLARE @Settings_ConfigMgrRootID int = (SELECT ID FROM PageArea WHERE Area = 'SettingsConfigMgr')
DECLARE @Settings_OSDRootID int = (SELECT ID FROM PageArea WHERE Area = 'SettingsOSD')
DECLARE @Settings_SoftwareRootID int = (SELECT ID FROM PageArea WHERE Area = 'SettingsSoftware')
DECLARE @Settings_ServicesRootID int = (SELECT ID FROM PageArea WHERE Area = 'SettingsServices')
DECLARE @Settings_SecurityRootID int = (SELECT ID FROM PageArea WHERE Area = 'SettingsSecurity')

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsGeneralGeneral')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_GeneralRootID, 'Settings', 'SettingsGeneralGeneral', 'General Settings', 1070)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsGeneralDomains')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_GeneralRootID, 'Settings', 'SettingsGeneralDomains', 'Domains', 1080)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsGeneralDNS')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_GeneralRootID, 'Settings', 'SettingsGeneralDNS', 'DNS', 1080)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsGeneralCommence')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_GeneralRootID, 'Settings', 'SettingsGeneralCommence', 'Commence', 1090)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsGeneralViews')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_GeneralRootID, 'Settings', 'SettingsGeneralViews', 'Views', 1100)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsGeneralCache')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_GeneralRootID, 'Settings', 'SettingsGeneralCache', 'Cache', 1110)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsGeneralRemoteTools')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_GeneralRootID, 'Settings', 'SettingsGeneralRemoteTools', 'Remote Tools', 1120)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsGeneralLicense')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_GeneralRootID, 'Settings', 'SettingsGeneralLicense', 'License', 1130)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsConfigMgrGeneral')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_ConfigMgrRootID, 'Settings', 'SettingsConfigMgrGeneral', 'General Settings', 1140)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsConfigMgrReporting')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_ConfigMgrRootID, 'Settings', 'SettingsConfigMgrReporting', 'Reporting Services', 1145)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsConfigMgrProfiles')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_ConfigMgrRootID, 'Settings', 'SettingsConfigMgrProfiles', 'Software Templates', 1150)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsConfigMgrSites')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_ConfigMgrRootID, 'Settings', 'SettingsConfigMgrSites', 'Sites', 1160)
END

--IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsConfigMgrMW')
--BEGIN
--  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_ConfigMgrRootID, 'Settings', 'SettingsConfigMgrMW', 'Maintenance Windows', 1180)
--END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsConfigMgrPackages')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_ConfigMgrRootID, 'Settings', 'SettingsConfigMgrPackages', 'Packages', 1190)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsConfigMgrTS')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_ConfigMgrRootID, 'Settings', 'SettingsConfigMgrTS', 'Task Sequences', 1210)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsOSDGeneral')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_OSDRootID, 'Settings', 'SettingsOSDGeneral', 'General Settings', 1230)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsOSDOU')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_OSDRootID, 'Settings', 'SettingsOSDOU', 'Organizational Units', 1240)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsOSDSeries')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_OSDRootID, 'Settings', 'SettingsOSDSeries', 'Number Series', 1250)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsOSDTemplates')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_OSDRootID, 'Settings', 'SettingsOSDTemplates', 'Templates', 1260)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsSoftwareSources')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_OSDRootID, 'Settings', 'SettingsSoftwareSources', 'Software Sources', 1270)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsSoftwareReplication')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_OSDRootID, 'Settings', 'SettingsSoftwareReplication', 'Content Distribution', 1280)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsSoftwareSWOrder')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_OSDRootID, 'Settings', 'SettingsSoftwareSWOrder', 'Software Order', 1310)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsSoftwareSWOrderLinking')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_OSDRootID, 'Settings', 'SettingsSoftwareSWOrderLinking', 'Software Order Linking', 1320)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsServicesReg')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_ServicesRootID, 'Settings', 'SettingsServicesReg', 'Registered Services', 1330)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsServicesTasks')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_ServicesRootID, 'Settings', 'SettingsServicesTasks', 'Tasks', 1340)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsSecurityDS')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_SecurityRootID, 'Settings', 'SettingsSecurityDS', 'Deployment Scopes', 1340)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsSecurityGroups')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_SecurityRootID, 'Settings', 'SettingsSecurityGroups', 'Security Groups', 1350)
END

IF NOT EXISTS (SELECT * FROM PageArea WHERE [Area] = 'SettingsSecurityAreas')
BEGIN
  INSERT INTO PageArea ([ParentArea], [AreaType], [Area], [Description], [Position]) VALUES(@Settings_SecurityRootID, 'Settings', 'SettingsSecurityAreas', 'Security Areas', 1360)
END

/*** DataSource Default ***/

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND type in (N'U'))
BEGIN
	/*** To update DataSource table if there is any changes in its items. ***/
	DELETE FROM DataSource
END

IF NOT EXISTS (SELECT * FROM [dbo].[DataSource] WHERE [Id] = '2A8E8259-76A9-40E2-BD35-C6A1BC5F16F2')
BEGIN
  INSERT [dbo].[DataSource] ([Id], [Title], [ConnectionString], [Query], [DataSourceId])
       VALUES ('2A8E8259-76A9-40E2-BD35-C6A1BC5F16F2', N'Total Computers', N'', N'SELECT COUNT(*) as TotalComputer FROM Computer',1)  
END
IF NOT EXISTS (SELECT * FROM [dbo].[DataSource] WHERE [Id] = '549F58A7-1062-4645-8934-1E3E9ED4775A')
BEGIN
  INSERT [dbo].[DataSource] ([Id], [Title], [ConnectionString], [Query], [DataSourceId])
       VALUES ('549F58A7-1062-4645-8934-1E3E9ED4775A', N'Total Users', N'', N'SELECT COUNT(*) as TotalUser FROM [User]',1)  
END
IF NOT EXISTS (SELECT * FROM [dbo].[DataSource] WHERE [Id] = '13671120-1969-49A3-947A-8D35436B29EF')
BEGIN
  INSERT [dbo].[DataSource] ([Id], [Title], [ConnectionString], [Query], [DataSourceId])
       VALUES ('13671120-1969-49A3-947A-8D35436B29EF', N'Get Client Health', N'', N'SELECT ISNULL(CONVERT(int, (ROUND((NULLIF(cs.ClientsHealthy, 0) * 100.0 / NULLIF(cs.ClientsTotal, 0)), 0))), 0) AS Percentage FROM v_CH_ClientSummaryCurrent cs
				INNER JOIN v_Collection c on c.CollectionID = cs.CollectionID WHERE (cs.CollectionID = ''SMSDM003'' AND c.Name = ''All Desktop and Server Clients'')',2)  
END
IF NOT EXISTS (SELECT * FROM [dbo].[DataSource] WHERE [Id] = '3BBF8B26-3B76-45C3-AB0F-25EE7C88BF59')
BEGIN
  INSERT [dbo].[DataSource] ([Id], [Title], [ConnectionString], [Query], [DataSourceId])
       VALUES ('3BBF8B26-3B76-45C3-AB0F-25EE7C88BF59', N'Get Client Activity', N'', N'SELECT ISNULL(CONVERT(int, (ROUND((NULLIF(cs.ClientsActive, 0) * 100.0 / NULLIF(cs.ClientsTotal, 0)), 0))), 0) AS Percentage FROM v_CH_ClientSummaryCurrent cs
				INNER JOIN v_Collection c on c.CollectionID = cs.CollectionID WHERE (cs.CollectionID = ''SMSDM003'' AND c.Name = ''All Desktop and Server Clients'')',2)  
END
IF NOT EXISTS (SELECT * FROM [dbo].[DataSource] WHERE [Id] = 'D1B8C63A-5068-417A-BE34-D120C37577CD')
BEGIN
  INSERT [dbo].[DataSource] ([Id], [Title], [ConnectionString], [Query], [DataSourceId])
       VALUES ('D1B8C63A-5068-417A-BE34-D120C37577CD', N'Client by State', N'', N'SELECT State, COUNT(State) as StateCount FROM Computer WHERE Client = 1 GROUP BY State',1)  
END
IF NOT EXISTS (SELECT * FROM [dbo].[DataSource] WHERE [Id] = 'D32A8E45-7A97-4256-A54A-78982BDD2A15')
BEGIN
  INSERT [dbo].[DataSource] ([Id], [Title], [ConnectionString], [Query], [DataSourceId])
       VALUES ('D32A8E45-7A97-4256-A54A-78982BDD2A15', N'Client by OS', N'', N'SELECT ISNULL(NULLIF(OperatingSystem, ''''), ''None'') as OperatingSystem , COUNT(OperatingSystem) as OSCount FROM Computer WHERE Client = 1 GROUP BY OperatingSystem',1)  
END
IF NOT EXISTS (SELECT * FROM [dbo].[DataSource] WHERE [Id] = 'f777ab9e-8f41-4cfc-9c02-067a210db00e')
BEGIN
  INSERT [dbo].[DataSource] ([Id], [Title], [ConnectionString], [Query], [DataSourceId])
       VALUES ('f777ab9e-8f41-4cfc-9c02-067a210db00e', N'Missing Update by Severity', N'', N'SELECT COUNT([Severity]) AS SeverityCount ,ISNULL(CASE [SeverityName] WHEN '''' THEN ''None'' ELSE [SeverityName] END, ''None'') as Severity FROM [dbo].[vSMS_SoftwareUpdate] GROUP BY [SeverityName]',2)  
END
IF NOT EXISTS (SELECT * FROM [dbo].[DataSource] WHERE [Id] = '6AACC7A5-D799-46EA-AD77-3AB2FEAA81C1')
BEGIN
  INSERT [dbo].[DataSource] ([Id], [Title], [ConnectionString], [Query], [DataSourceId])
       VALUES ('6AACC7A5-D799-46EA-AD77-3AB2FEAA81C1', N'Deployment Status', N'', N'DECLARE @Part1 nvarchar(max) = ''WITH dsum as ( 
					  SELECT MAX(dsc.CollectionID) as CollectionID,  
							 dsc.OfferID,  
							 MAX(dsc.ModelID) as ModelID,  
							 dsc.AssignmentID, 
							 MAX(co.CollectionName) AS CollectionName,  
							 MAX(dsc.Description) AS SoftwareName,  
							 MAX(dsc.DeploymentTime) AS DeploymentTime, 
							 MAX(dsc.ModificationTime) as ModificationTime,  
							 MAX(dsc.Type) AS FeatureType,  
							 MAX(dsc.SummaryType) AS SummaryType,  
							 MAX(dsc.DeploymentIntent) AS DeploymentIntent, 
							 SUM(dsc.NumberInstalled) AS NumberSuccess,  
							 SUM(dsc.NumberInProgress) AS NumberInProgress,  
							 SUM(dsc.NumberUnknown) AS NumberUnknown, 
							 SUM(dsc.NumberErrors) AS NumberErrors,  
							 SUM(dsc.NumberReqsNotMet) as NumberOther, 
							 MAX(dsc.SummarizationTime) as SummarizationTime  
					  FROM dbo.DeploymentSummary AS dsc INNER JOIN 
						   dbo.Collections AS co ON dsc.CollectionID = co.SiteID 
					  WHERE dsc.Type NOT IN (2, 3, 5, 7) /* Exclude Classic and SUM Deployments */  
						AND (dsc.SummaryType=1 or (dsc.SummaryType=2 and dsc.SiteNumber = (SELECT TOP 1 [SiteNumber] FROM [SMSData]))) 
				 GROUP BY dsc.OfferID, dsc.AssignmentID),
				 tempDeploymentStatusView as 
				 (  
 
					 SELECT CollectionID, 
							OfferID, 
							cipolicy.ModelID as PolicyModelID,    
							dsum.ModelID,  
							dsum.AssignmentID,  
							CollectionName,  
							dsum.SoftwareName,  
							DeploymentTime,  
							cia.CreationTime, 
							ModificationTime,  
							FeatureType,  
							SummaryType, 
							DeploymentIntent,  
							cia.EnforcementDeadline,  
							NumberSuccess,  
							NumberInProgress, 
							CASE WHEN OfferTypeID=2 THEN 0 
								 ELSE NumberUnknown  
							END AS NumberUnknown,  
							NumberErrors,  
							NumberOther, 
							NumberSuccess + NumberInProgress + NumberUnknown + NumberOther + NumberErrors as NumberTotal, 
							SummarizationTime,  
							NULL AS ProgramName,  
							ccp.PkgID as PackageID  
					 FROM dsum  
					 INNER JOIN CI_CIAssignments cia on dsum.AssignmentID = cia.AssignmentID  
					 INNER JOIN CI_AssignmentTargetedCIs cit on cit.AssignmentID = dsum.AssignmentID 
					 INNER JOIN CI_ConfigurationItems cipolicy on cipolicy.CI_ID = cit.ActualCI_ID 
					 LEFT JOIN CIContentPackage ccp on ccp.CI_ID = cit.CI_ID  
					 WHERE cia.IsTombstoned = 0  
  
					 UNION ALL  
  
					 SELECT distinct co.SiteID as CollectionID,   
							'''''''' as OfferID, 
							cipolicy.ModelID as PolicyModelID,    
							ci.ModelID as ModelID,   
							cia.AssignmentID,   
							co.CollectionName,   
							'''''''' as SoftwareName,   
							cia.StartTime as DeploymentTime,   
							cia.CreationTime,   
							cia.LastModificationTime as ModificationTime,   
							CASE WHEN ci.CIType_ID = 2 THEN 6  
								 WHEN ci.CIType_ID = 10 THEN 1  
								 WHEN ci.CIType_ID = 50 THEN 11 
								 END as FeatureType,          
							case when co.CollectionType = 2 then 1  
								 when co.CollectionType = 1 then 2  
								 else 0  
								 end as SummaryType, 
							CASE WHEN OfferTypeID=0 THEN 1  
								 WHEN OfferTypeID=2 THEN 2  
								 WHEN OfferTypeID=3 THEN 3 
								 ELSE 0 
								 END as DeploymentIntent,  
							cia.EnforcementDeadline as EnforcementDeadline,  
							NULL as NumberSuccess,  
							Null as NumberInProgress,  
							NULL as NumberUnknown,  
							NULL as NumberErrors,  
							NULL as NumberOther, 
							NULL as NumberTotal,  
							NULL as SummarizationTime, 
							NULL AS ProgramName,  
							ccp.PkgID as PackageID  
					 from CI_CIAssignments cia   
					 inner join CI_AssignmentTargetedCIs cit on cia.AssignmentID = cit.AssignmentID 
					 INNER JOIN CI_ConfigurationItems cipolicy on cipolicy.CI_ID = cit.ActualCI_ID  
					 LEFT JOIN CIContentPackage ccp on ccp.CI_ID = cit.CI_ID  
					 INNER JOIN vSMS_ConfigurationItems ci ON cit.CI_ID = ci.CI_ID  
					 inner join Collections co on co.CollectionID = cia.TargetCollectionID  
					 where (ci.CIType_ID = 2 or ci.CIType_ID = 10 or ci.CIType_ID = 50) and not exists (select 1 from dsum where dsum.AssignmentID = cia.AssignmentID) and cia.IsTombstoned = 0  
  
					UNION ALL  
						--  
						-- Query Classic Deployments (previously known as Advertisements)  
						--  
						SELECT   
							MIN(cd.CollectionID)          AS CollectionID,  
							cd.DeploymentID               AS OfferID, 
							0 /* Not Applicable */        AS PolicyModelID,           
							0 /* Not Applicable */        AS ModelID,  
							0  /* Not Applicable */       AS AssignmentID,        
							MIN(cd.CollectionName)        AS CollectionName,  
							CASE  
								WHEN MIN(cd.IsTaskSequenceDeployment) = 1 THEN MIN(cd.PackageName)  
								ELSE MIN(cd.PackageName) + N''''('''' + MIN(cd.ProgramName) + N'''')''''  
							END                           AS [SoftwareName],  
							MAX(cd.DeploymentTime)        AS DeploymentTime,  
							NULL /* Not Applicable */     AS CreationTime,  
							MAX(cd.ModificationTime)      AS ModificationTime,  
							CASE   
								WHEN MIN(cd.IsDeviceDeployment) = 1         THEN 3 /* Device Program */  
								WHEN MIN(cd.IsTaskSequenceDeployment) = 1   THEN 7 /* Task Sequence */  
								ELSE 2                                             /* Program */  
							END                           AS FeatureType, 
							CASE  
								WHEN MIN(IsDeviceDeployment) = 1 THEN  1  
								ELSE 2 
							END                           AS SummaryType, 
							MIN(cd.Purpose)               AS DeploymentIntent, 
							MIN(cd.DeadlineTime)          AS EnforcementDeadline, 
							SUM(dsc.NumberInstalled)      AS NumberSuccess, 
							SUM(dsc.NumberInProgress)     AS NumberInProgress, 
							CASE  
								WHEN MIN(cd.Purpose) = 2 THEN 0 
								ELSE SUM(dsc.NumberUnknown) 
							END AS NumberUnknown, 
							SUM(dsc.NumberErrors)         AS NumberErrors, 
							SUM(dsc.NumberReqsNotMet)     AS NumberOther, 
							SUM(NumberInstalled) + SUM(NumberInProgress) + SUM(NumberUnknown) + SUM(NumberReqsNotMet) + SUM(NumberErrors) as NumberTotal, 
							MAX(dsc.SummarizationTime)    AS SummarizationTime, 
							MIN(cd.ProgramName)           AS ProgramName, 
							MIN(cd.PackageID)             AS PackageID 
						FROM vClassicDeployments cd 
						LEFT JOIN DeploymentSummary dsc ON (dsc.OfferID = cd.DeploymentID AND dsc.Type IN (2, 3, 7)) 
						GROUP BY cd.DeploymentID 
 
					UNION ALL 
 
						-- SUM deployment summaries  
						select distinct  
							a.CollectionID, 
							OfferID='''''''', 
							PolicyModelID=ci.ModelId,   
							ModelID=ci.ModelId,  
							a.AssignmentID,  
							a.CollectionName,  
							'''''''' AS [SoftwareName],  
							DeploymentTime=a.StartTime,  
							CreationTime=a.CreationTime,  
							ModificationTime=a.LastModificationTime,  
							FeatureType=5,  
							SummaryType=1, 
							DeploymentIntent=case when a.EnforcementDeadline is not null then 1 else 2 end,  
							a.EnforcementDeadline,  
							NumberSuccess=ISNULL(NumSuccess, 0),  
							NumberInProgress=ISNULL(NumInProgress, 0),  
							NumberUnknown=ISNULL(NumUnknown, 0),  
							NumberErrors=ISNULL(NumError, 0),  
							NumberOther=ISNULL(NumReqsNotMet, 0),  
							NumberTotal=(ISNULL(NumSuccess, 0) + ISNULL(NumInProgress, 0) + ISNULL(NumUnknown, 0) + ISNULL(NumError, 0) + ISNULL(NumReqsNotMet, 0)), 
							SummarizationTime,  
							ProgramName='''''''',         
							PackageID='''''''' 
						from v_CIAssignment a  
						left join CI_AssignmentTargetedGroups atg on atg.AssignmentID=a.AssignmentID 
						left join CI_AssignmentTargetedCIs atc on atc.AssignmentID=a.AssignmentID           
						left join v_CIAssignmentSummary cas on cas.AssignmentID=a.AssignmentID  
						left join CI_ConfigurationItems ci on ci.CI_ID = ISNULL(atg.CI_ID, atc.CI_id) 
						where a.AssignmentType in (1,5) 
				),''
				DECLARE @Part2 nvarchar(max) = ''cte (val)
                AS
                (
                    SELECT MAX(v) FROM 
                    (
                    SELECT MAX(NumberSuccess) OVER() AS v FROM tempDeploymentStatusView
                    UNION SELECT MAX(NumberInProgress) OVER() AS v FROM tempDeploymentStatusView
                    UNION SELECT MAX(NumberUnknown) OVER() AS v FROM tempDeploymentStatusView
                    UNION SELECT MAX(NumberErrors) OVER() AS v FROM tempDeploymentStatusView
                    UNION SELECT MAX(NumberOther) OVER() AS v FROM tempDeploymentStatusView
                    ) AS VALUE(v)
                )
                SELECT CASE WHEN DSC.NumberErrors > 0 THEN 0
                            WHEN DSC.NumberInProgress > 0 THEN 1
                            WHEN DSC.NumberUnknown > 0 THEN 2
                            WHEN DSC.NumberOther > 0 THEN 3
                            ELSE 4
                        END AS [Status],
                        DSC.NumberSuccess, 
                        DSC.NumberInProgress, 
                        DSC.NumberUnknown, 
                        DSC.NumberErrors, 
                        DSC.NumberOther AS NumberReqsNotMet, 
                        DSC.NumberTotal AS NumberTargeted'';
                DECLARE @Part3 nvarchar(max) = ''
                FROM   tempDeploymentStatusView DSC 
                        LEFT JOIN CI_CIAssignments CIA 
                                ON CIA.AssignmentID = DSC.AssignmentID 
                        LEFT JOIN vSMS_ConfigurationItems CI 
                                ON CI.ModelID = DSC.ModelID 
                                    AND CI.IsLatest = 1 
                        LEFT JOIN ProgramOffers AS PO 
                                ON DSC.OfferID = PO.OfferID 
                        LEFT JOIN fn_LocalizedCIProperties(1033) AS LOC 
                                ON CI.CI_ID = LOC.CI_ID 
                        LEFT JOIN Collections C 
				                ON C.SiteID = DSC.CollectionID'';

                DECLARE @Part4 nvarchar(max) = '''';

                IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = ''CI_CIAssignments'' AND COLUMN_NAME = ''ParentAssignmentID'')
                BEGIN
	                SET @Part4 = ''
	                    LEFT JOIN CI_CIAssignments PASSIGNMENT 
                                ON PASSIGNMENT.AssignmentID = ISNULL(CIA.ParentAssignmentID, 0)'';
                END

                DECLARE @Part5 nvarchar(max) = ''
                JOIN cte ON 1 = 1 
                WHERE  ( ( NOT ( CI.CI_ID IS NULL AND PO.OfferID IS NULL ) ) 
                            OR CIA.AssignmentType IN ( 1, 5 ) )
                AND DSC.DeploymentTime IS NOT NULL AND DSC.DeploymentTime >= ''''1/1/1900''''
                ORDER  BY 1'';

                EXEC(@Part1 + @Part2 + @Part3 + @Part4 + @Part5);', 2)  
END

--delete from pagearea
/*** PageArea end ***/


/*** Set timestamp ***/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DatabaseHistory]') AND type in (N'U'))
BEGIN
  INSERT INTO [dbo].[DatabaseHistory] (Name,[Timestamp]) VALUES ('dbData.sql',getdate())
END