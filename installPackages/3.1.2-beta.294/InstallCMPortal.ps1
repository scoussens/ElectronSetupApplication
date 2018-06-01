#----------------------------------------------
#-------- ConfigMgr Portal Installer ----------
#----------------------------------------------
# v2017.10.18.1
#Description: Installs the Cireson Configuration Manager Portal

#Parameters
param(
    $ConfigMgrSiteServer = "", #CMPrimarySite01
    $ConfigMgrSqlServer = "", #CMPrimaryDB01
    $ConfigMgrDatabaseName = "", #CM_DST
    $SiteRootPath = "C:\InetPub\",
    $SiteName = "ControlCenter",
    $SitePort = 80,
    $AppPoolUser = "",
    $AppPoolPassword = "",
    $ServiceUser = "",
    $ServicePassword = "",
    $ApplicationTitle = "Control Center",
    $LanguageCode = "ENU",
    $LanguageCodeDateTime = "ENU",
    $CmpSqlServer = "", #CMPrimaryDB01, or CMPortalDB01
    $CmpDatabaseName = "", #ConfigMgr_Portal
    $InstallWebsite = $true,
    $InstallDatabase = $true,
    $InstallServices = $true,
    $LogFilePath = (${env:Temp} + "\CiresonInstall" + (Get-Date -format "yyyy-MM-dd-hh-mm-ss") + ".log"),
    $CacheLanguageCodes = "*",
    $AcceptEula = $true,
    $SQLDBPath = "",
    $SQLDBLogPath = $SQLDBPath, 
    $SSLCertificateName = "",
    $LicenseKey = "",
    $CmpAdminGroup = "",
    $EnableMdtIntegration = $false,
    $ConfigMgrSqlLogin = "",
    $ConfigMgrSqlPasswordHash = "",
    $ConfigMgrDbUseWinAuth = $true,
    $CmpDbUseWinAuth = $true,
    $MdtDbUseWinAuth = $true,
    $CmpSqlLogin = "",
    $CmpSqlPasswordHash = "",
    $MdtSqlLogin = "",
    $MdtSqlPasswordHash = "",
    $MdtSqlServer = "",
    $MdtDatabaseName = "",
    $CustomerKey = "",
    $DeploymentServicePort = "",
    $CacheServicePort = "",
    $UseLocalSystemAsServiceAccount = $true,
    $IsSql2014OrGreater = $false,
    $Hostname = "",
    $SsrsServerName = "",
    $SsrsDbUseWinAuth = "",
    $SsrsSqlLogin = "",
    $SsrsDatabaseName = "",
    $SsrsSqlPasswordHash = "",
    $IsUpgradeScenario = $false,
    $EnableSsrsIntegration = $false,
    $PlatformServiceUser = "",
    $PlatformServicePassword = "",
    $PlatformServicePort = $null,
    $PlatformServiceUrl = '*',
    $PlatformCPEXAppVersion = $null,
    $PlatformLogLevel = "500",
    $UseAppPoolAsPlatformServiceAccount = $true,
    $PlatformConfigMgrServiceUser = "",
    $PlatformConfigMgrServicePassword = "",
    $UseWinAuthForRemoteManage = $false,
    $RemoteManageServiceUser = $null,
    $RemoteManageServicePassword = $null,
    $UsePlatformServiceAccountForConfigMgr = $true,
	$UsePlatformServiceAccountForAdSync = $true,
    $AdSyncUser = "",
    $AdSyncPassword = "",
	$Ldap = "",
	$AddHostNameToDns = $false,
	$HttpsListenerPort = 443
)

$CurrentDirectory = (Split-Path $script:MyInvocation.MyCommand.Path)
$InstallationFilesDir = $CurrentDirectory + "\InstallationFiles"
$programDataPath = $env:ProgramData + "\Cireson.Platform.Host"
$platformServiceName = "CMPPlatformService"
$platformCPEXApp = "Cireson.ConfigurationManager.Portal.Core"

function writeToLog([string] $message) {
    try {
        $message + "`n"
        #Add-Content $LogFilePath ((Get-Date -format "yyyy-MM-dd-hh-mm-ss") + ": " + $message + "`n")
    }
    catch {
    }
}

function writeProgress([int] $progress) {
    ("%progress%=" + $progress + "`n")
}

function writeWarning([string] $warning) {
    writeToLog $warning;
    ("%warning%=" + $warning + "`n")
}

function writeError([string] $error) {
    writeToLog $error;
    ("%error%=" + $error + "`n")
}

function replaceTokensInFile([string]$filePath, [string]$token, [string]$replaceWith) {  
    writeToLog ("Replacing content in: $filePath.  Token: $token, Value: $replaceWith")

    $fileContent = (gc -path $filePath -Raw).replace($token, $replaceWith)
    $fileContent | Out-File -FilePath $filePath -Encoding utf8
}

function isOfflineInstall() {
    return Test-Path -Path ".\OfflineCpex"
}

 # Here we are have a function because this particular property requires double \\ which is not provided by the installer
function fixUsername($username) {
    if ($username.split("\").count > 2) {
        return $username;
    }
		
    return $username.replace("\", "\\");
}


function installPlatform() {
    $platformInstallPath = $SiteRootPath + $SiteName + "\Platform"
	
    if (isOfflineInstall) {
        writeToLog("Offline mode, importing module 'Cpexlets.psm1'") 
        Import-Module "./OfflineCpex/Cpexlets.psm1" -Force 
        writeToLog("Module 'Cpexlets.psm1' imported") 
    }
    else {
        #Register Platform cmdlet feed
        writeToLog("Setting up environment for Cireson Platform installation...") 
        $env:PSModulePath = $env:PSModulePath + "; $env:ProgramFiles\WindowsPowerShell\Modules"  #For some reason this path is not added to the user env variables.
		writeToLog("Importing required PowerShell module 'PackageManagement'.")
        Import-Module PackageManagement
		writeToLog("Registering Package Source 'https://cireson.myget.org/F/public/api/v2'.")
        Register-PackageSource "https://cireson.myget.org/F/public/api/v2" -Name CiresonDevelopmentFeed -Trusted -ProviderName PowerShellGet -ForceBootstrap -Force -ErrorAction SilentlyContinue
        writeToLog("Removing any existing local CpexLets modules.")
		Remove-Module -Name Cpexlets -Force -ErrorAction SilentlyContinue
        writeToLog("Installing CpexLets module.")
        Install-Module -Name CpexLets -Force
		writeToLog("Connecting to the Cireson MyGet feed.")
        Connect-CPEXFeed -feedName public
    }

    writeToLog("Generating Cireson Platform configuration file...")
    #Create platform configuration file
    $connectionString = Get-CPEXPlatformConnectionString -sqlServerName $CmpSqlServer -databaseName $CmpDatabaseName

    # Create website bindings for the platform installation
    $bindings = @()
    if ([string]::IsNullOrEmpty($Hostname)) {
        $bindings += $PlatformServiceUrl
    }
    else {
        $bindings += $Hostname
    }
	#Add localhost to the url list
	$bindings += 'localhost'

    $appSettings = @(
        "CmpConfigurationFilePath", 
        ($SiteRootPath + $SiteName + "\Configuration.xml"), 
        "CmpDatabaseConnectionString", 
        $connectionString,
        "httpHeader:x-frame-options",
        ""
    );

    if ($PlatformLogLevel -ne $null) {
        $appSettings += "LogLevel";
        $appSettings += $PlatformLogLevel;
    }
	if ($UseAppPoolAsPlatformServiceAccount -eq $true)
	{
		$PlatformServicePassword = $AppPoolPassword
	}
	#Set Configuration Manager adapter settings
	$configMgrAdapterPassword = $AppPoolPassword
	if ($UsePlatformServiceAccountForConfigMgr -eq $true -and $UseAppPoolAsPlatformServiceAccount) {
        $user = fixUsername($AppPoolUser);
        writeToLog("Using AppPool Account for platform access to Configuration Manager... $AppPoolUser")
		$configMgrAdapterPassword = $AppPoolPassword
    }
    elseif ($UsePlatformServiceAccountForConfigMgr -eq $true -and $UseAppPoolAsPlatformServiceAccount -eq $false) {
        $user = fixUsername($PlatformServiceUser);
        writeToLog("Using Platform Service Account for platform access to Configuration Manager... $PlatformServiceUser")
		$configMgrAdapterPassword = $PlatformServicePassword
    }
    else {
        $user = fixUsername($PlatformConfigMgrServiceUser);
        writeToLog("Using Configuration Manager Account for platform access to Configuration Manager... $PlatformConfigMgrServiceUser")
		$configMgrAdapterPassword = $PlatformConfigMgrServicePassword
    }
	$appSettings += "Cireson.ConfigurationManager.Portal.Core.ConfigMgrAdapter.Models.AdapterConfiguration";
    $appSettings += "{`"ConfigMgrSiteServer`":`"$ConfigMgrSiteServer`",`"ConfigMgrUserName`":`"$user`",`"ConfigMgrPassword`":`'$configMgrAdapterPassword`'}"

	#Set AD sync adapeter settings
	$adAdapterPassword = $AppPoolPassword
	if ($UsePlatformServiceAccountForAdSync -eq $true -and $UseAppPoolAsPlatformServiceAccount) {
		$splitCreds = $AppPoolUser.Split("{\}")
        $domain = $splitCreds[0]
        $userName = $splitCreds[1]
        writeToLog("Using AppPool Account for AD Synchronization... $AppPoolUser")
		$adAdapterPassword  = $AppPoolPassword
    }
    elseif ($UsePlatformServiceAccountForAdSync -eq $true -and $UseAppPoolAsPlatformServiceAccount -eq $false) {
		$splitCreds = $PlatformServiceUser.Split("{\}")
        $domain = $splitCreds[0]
        $userName = $splitCreds[1]
        writeToLog("Using Platform Service Account for AD Synchronization... $PlatformServiceUser")
		$adAdapterPassword  = $PlatformServicePassword
    }
    else {
		$splitCreds = $AdSyncUser.Split("{\}")
        $domain = $splitCreds[0]
        $userName = $splitCreds[1]
        writeToLog("Using Configuration Manager Account for AD Synchronization... $AdSyncUser")
		$adAdapterPassword  = $AdSyncPassword
    }
	writeToLog("AD Synchronization LDAP: $Ldap")
	$appSettings += "Cireson.ConfigurationManager.Portal.Core.ActiveDirectoryAdapter.Models.AdAdapterConfiguration";
	$appSettings += "{`"LdapPath`":`"$Ldap`",`"Domain`":`"$domain`",`"UserName`":`"$userName`",`"Password`":`'$adAdapterPassword`'}"

	#Set Remote Manage adapter settings
	 $appSettings += "Cireson.RemoteManage.PlatformServices.Adapter.Models.CimAdapterConfiguration";
    if ($UseWinAuthForRemoteManage -eq $false -and $RemoteManageServiceUser -ne $null) {
        $splitCreds = $RemoteManageServiceUser.Split("{\}")
        $domain = $splitCreds[0]
        $userName = $splitCreds[1]
		writeToLog("Using named account for Remote Manage execution... $RemoteManageServiceUser")
    }
	else 
	{
		if ($UseWinAuthForRemoteManage -eq $true)
		{
			writeToLog("Using the account for the user logged on to TCC for Remote Manage execution.")
			$RemoteManageServicePassword = $PlatformServicePassword
		}
		else
		{
			writeToLog("No account was specified for Remote Manage execution.")
			$RemoteManageServicePassword = $PlatformServicePassword
		}
	}
	
    $appSettings += "{`"Domain`":`"$domain`",`"UserName`":`"$userName`",`"Password`":`'$RemoteManageServicePassword`',`"UseWinAuth`":`"$UseWinAuthForRemoteManage`"}"

    if ($PlatformServicePort -eq $null) { $PlatformServicePort = $SitePort }
	
    writeToLog("Writing out Cireson Platform Configuration File...");
    New-CPEXPlatformConfig `
        -connectionString $connectionString `
        -serviceName $platformServiceName `
        -installPath $platformInstallPath `
        -sslCertificateName $SSLCertificateName `
        -configFilePath $platformInstallPath\CMP_Platform.config `
        -hosts $bindings `
        -httpPorts ($PlatformServicePort) `
        -virtualRoot "Platform" `
        -defaultApplicationName $platformCPEXApp `
        -defaultApplicationVersion $PlatformCPEXAppVersion `
        -enableWorkerProcesses $true `
        -additionalAppSettings $appSettings `
		-sslPorts $HttpsListenerPort


    writeToLog("Installing the Cireson Platform...");
    #Install platform
    if ($UseAppPoolAsPlatformServiceAccount) {
        writeToLog("Using $AppPoolUser as the logon user for the platform service.");
        addAccountToLocalAdministratorGroup($AppPoolUser)
        if (isOfflineInstall) {
            Get-CPEXPlatformConfig -path $platformInstallPath\CMP_Platform.config | Install-CPEXOfflineInstallerPackage -installationMediaPath ".\OfflineCpex\" -serviceUser $AppPoolUser -servicePassword $AppPoolPassword
        }
        else {
            Get-CPEXPlatformConfig -path $platformInstallPath\CMP_Platform.config | Install-CPEXPlatform -serviceUser $AppPoolUser -servicePassword $AppPoolPassword
        }
    }
    else {
        writeToLog("Using $PlatformServiceUser as the logon user for the platform service and adding user to local administrators group...");
        addAccountToLocalAdministratorGroup($PlatformServiceUser)
        createPlatformSQLLogins
        if (isOfflineInstall) {
            Get-CPEXPlatformConfig -path $platformInstallPath\CMP_Platform.config | Install-CPEXOfflineInstallerPackage -installationMediaPath ".\OfflineCpex\" -serviceUser $PlatformServiceUser -servicePassword $PlatformServicePassword
        }
        else {
            Get-CPEXPlatformConfig -path $platformInstallPath\CMP_Platform.config | Install-CPEXPlatform -serviceUser $PlatformServiceUser -servicePassword $PlatformServicePassword
        }
    }

    writeToLog("Setting IIS as a Platform Service Dependency...");
    sleep 10 # wait for the platform to startup
    sc.exe config "Platform_$platformServiceName" depend= W3SVC start= delayed-auto # set the platform dependency on iis

    writeToLog("Platform installation appears to have been successful. Sweet.")
}


function deployManagementDatabase() {
    try {
        writeToLog "Creating ConfigMgr Portal database."
        Copy-Item -Path "$InstallationFilesDir\DBScripts\ConfigMgrPortal.sql" -Destination ("$InstallationFilesDir\DBScripts\ConfigMgrPortal-Temp.sql") -force
        $SQLCustomCreationOptions = "" 
        if ($SQLDBPath -ne "") {
            $SQLCustomCreationOptions = " ON  PRIMARY ( NAME = N'%CMPortalSQLServer%', FILENAME = N'%SQLDBPath%\%CMPortalSQLServer%.mdf') LOG ON ( NAME = N'%CMPortalSQLServer%_log', FILENAME = N'%SQLDBLogPath%\%CMPortalSQLServer%.ldf')"
        }

        #place holder value so the sql script doesn't choke...
        $tmpPortalUser = "~na"
		
        if ($AppPoolUser -ne "") {
            $tmpPortalUser = $AppPoolUser
        }
		

        replaceTokensInFile ("$InstallationFilesDir\DBScripts\ConfigMgrPortal-Temp.sql") "%SQLCustomCreationOptions%" $SQLCustomCreationOptions
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\ConfigMgrPortal-Temp.sql") "%SQLDBPath%" $SQLDBPath
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\ConfigMgrPortal-Temp.sql") "%SQLDBLogPath%" $SQLDBLogPath
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\ConfigMgrPortal-Temp.sql") "%PortalUser%" $tmpPortalUser
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\ConfigMgrPortal-Temp.sql") "%CMPortalSQLServer%" $CmpSqlServer
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\ConfigMgrPortal-Temp.sql") "%CMPortalDatabaseName%" $CmpDatabaseName

        writeToLog "Attempting to create ConfigMgr Portal Database " + $CmpDatabaseName
        Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\ConfigMgrPortal-Temp.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
        writeToLog "Done Creating ConfigMgr Portal Database " + $CmpDatabaseName + " on " + $CmpSqlServer
    }
    catch [Exception] {
        $ex = $_.Exception.Message
        writeError("Failed to create ConfigMgr Portal database  " + $CmpDatabaseName + " on " + $CmpSqlServer + " : " + $ex)
    }
}

function deployManagementSqlTablesAndData() {
    try {
        writeToLog "Setting up tables and default data within the $CmpDatabaseName database."
        Copy-Item -Path "$InstallationFilesDir\DBScripts\dbTables.sql" -Destination ("$InstallationFilesDir\DBScripts\dbTables-Temp.sql") -force
        Copy-Item -Path "$InstallationFilesDir\DBScripts\dbData.sql" -Destination ("$InstallationFilesDir\DBScripts\dbData-Temp.sql") -force
        $SQLCustomCreationOptions = "" 
        if ($SQLDBPath -ne "") {
            $SQLCustomCreationOptions = " ON  PRIMARY ( NAME = N'%CMPortalSQLServer%', FILENAME = N'%SQLDBPath%\%CMPortalSQLServer%.mdf') LOG ON ( NAME = N'%CMPortalSQLServer%_log', FILENAME = N'%SQLDBLogPath%\%CMPortalSQLServer%.ldf')"
        }

        #place holder value so the sql script doesn't choke...
        $tmpPortalUser = "~na"
		
        if ($AppPoolUser -ne "") {
            $tmpPortalUser = $AppPoolUser
        }
		
        if ($IsUpgradeScenario -eq $true) {
            writeToLog("Updating tables within '" + $CmpDatabaseName + "' database on " + $CmpSqlServer)
            Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\dbTables-Temp.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 -Database $CmpDatabaseName

            writeToLog("Updating data in tables within '" + $CmpDatabaseName + "' database  on " + $CmpSqlServer)
            Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\dbData-Temp.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 -Database $CmpDatabaseName

            writeToLog("Done updating ConfigMgr Portal Database '" + $CmpDatabaseName + "' on " + $CmpSqlServer)
        }
        else {
            writeToLog("Creating tables within '" + $CmpDatabaseName + "' database on " + $CmpSqlServer)
            Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\dbTables-Temp.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 -Database $CmpDatabaseName

            writeToLog("Populating data in tables within '" + $CmpDatabaseName + "' database  on " + $CmpSqlServer)
            Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\dbData-Temp.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 -Database $CmpDatabaseName

            writeToLog("Done Creating ConfigMgr Portal Database '" + $CmpDatabaseName + "' on " + $CmpSqlServer)
        }
    }
    catch [Exception] {
        $ex = $_.Exception.Message
        writeError("Failed to create or update ConfigMgr Portal database '" + $CmpDatabaseName + "' on " + $CmpSqlServer + " : " + "IsUpgradeScenario: " + $IsUpgradeScenario + " Exception: " + $ex)
    }
}

function createPlatformSQLLogins() {
    try {
        writeToLog("Creating Cireson Platform database logins.")
        Copy-Item -Path "$InstallationFilesDir\DBScripts\SetupLogins.sql" -Destination ("$InstallationFilesDir\DBScripts\SetupLogins-Platform-Temp.sql") -force

        replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Platform-Temp.sql") "%CMPortalDatabaseName%" $CmpDatabaseName
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Platform-Temp.sql") "%PortalUser%" $PlatformServiceUser

        writeToLog("Attempting to create Platform Database Logins on " + $CmpSqlServer)

        Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetupLogins-Platform-Temp.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
    }
    catch [Exception] {
        $ex = $_.Exception.Message
        writeError("Failed to create Platform Database logins on DB '" + $CmpDatabaseName + "' on server '$CmpSqlServer': " + $ex)
    }
}

function createSQLLogins() {
    
    try {
        writeToLog("Creating database Logins.")
        Copy-Item -Path "$InstallationFilesDir\DBScripts\SetupLogins.sql" -Destination ("$InstallationFilesDir\DBScripts\SetupLogins-Temp.sql") -force
        Copy-Item -Path "$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb.sql" -Destination ("$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb-Temp.sql") -force
        Copy-Item -Path "$InstallationFilesDir\DBScripts\SetSqlPermissions.sql" -Destination ("$InstallationFilesDir\DBScripts\SetSqlPermissions-Temp.sql") -force

        #place holder value so the sql script doesn't choke...
        $tmpPortalUser = "~na"
		
        if ($CmpDbUseWinAuth -and $AppPoolUser -ne "") {
            $tmpPortalUser = $AppPoolUser
        }
        else {
            if ($CmpSqlLogin -ne "") {
                $tmpPortalUser = $CmpSqlLogin
            }
        }
		
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Temp.sql") "%CMPortalDatabaseName%" $CmpDatabaseName
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Temp.sql") "%PortalUser%" $tmpPortalUser

        replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb-Temp.sql") "%ConfigMgrDatabaseName%" $ConfigMgrDatabaseName
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb-Temp.sql") "%PortalUser%" $tmpPortalUser
		
        replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetSqlPermissions-Temp.sql") "%PortalUser%" $tmpPortalUser

        writeToLog("Attempting to create ConfigMgr Portal Database Logins on " + $CmpSqlServer)

        Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetupLogins-Temp.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
        if ($IsSql2014OrGreater) {
            Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetSqlPermissions-Temp.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
        }
        writeToLog("Done Creating ConfigMgr Portal Database Logins " + $CmpDatabaseName + " on " + $CmpSqlServer)

        writeToLog("Attempting to create ConfigMgr Database Logins on " + $ConfigMgrSqlServer)
        Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb-Temp.sql" -ServerInstance $ConfigMgrSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
		
        if ($EnableMdtIntegration) {
            writeToLog("Attemping to create MDT Database logins on " + $MdtSqlServer)
            Copy-Item -Path "$InstallationFilesDir\DBScripts\SetupLogins-MdtDb.sql" -Destination ("$InstallationFilesDir\DBScripts\SetupLogins-MdtDb-Temp.sql") -force
            replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-MdtDb-Temp.sql") "%MdtDatabaseName%" $MdtDatabaseName
            replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-MdtDb-Temp.sql") "%PortalUser%" $tmpPortalUser
            Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetupLogins-MdtDb-Temp.sql" -ServerInstance $MdtSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
        }

        if ($EnableSsrsIntegration) {
            writeToLog("Attemping to create SSRS Database logins on " + $SsrsServerName)
            Copy-Item -Path "$InstallationFilesDir\DBScripts\SetupLogins-Ssrs.sql" -Destination ("$InstallationFilesDir\DBScripts\SetupLogins-Ssrs-Temp.sql") -force
            replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Ssrs-Temp.sql") "%SsrsDatabaseName%" $SsrsDatabaseName
            replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Ssrs-Temp.sql") "%PortalUser%" $tmpPortalUser
            Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetupLogins-Ssrs-Temp.sql" -ServerInstance $SsrsServerName -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
        }

        if ($UseLocalSystemAsServiceAccount) {
            writeToLog("UseLocalSystemAsServiceAccount = $UseLocalSystemAsServiceAccount, setting up SQL login for $env:COMPUTERNAME")
            $computerAccount = "$env:UserDomain\$env:COMPUTERNAME$"

            Copy-Item -Path "$InstallationFilesDir\DBScripts\SetupLogins.sql" -Destination ("$InstallationFilesDir\DBScripts\SetupLogins-Temp2.sql") -force
            Copy-Item -Path "$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb.sql" -Destination ("$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb-Temp2.sql") -force

            replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Temp2.sql") "%CMPortalDatabaseName%" $CmpDatabaseName
            replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Temp2.sql") "%PortalUser%" $computerAccount

            replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb-Temp2.sql") "%ConfigMgrDatabaseName%" $ConfigMgrDatabaseName
            replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb-Temp2.sql") "%PortalUser%" $computerAccount

            Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetupLogins-Temp2.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
            Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetupLogins-ConfigMgrDb-Temp2.sql" -ServerInstance $ConfigMgrSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 

            if ($EnableMdtIntegration) {
                Copy-Item -Path "$InstallationFilesDir\DBScripts\SetupLogins-MdtDb.sql" -Destination ("$InstallationFilesDir\DBScripts\SetupLogins-MdtDb-Temp2.sql") -force
                replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-MdtDb-Temp2.sql") "%MdtDatabaseName%" $MdtDatabaseName
                replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-MdtDb-Temp2.sql") "%PortalUser%" $computerAccount
                Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetupLogins-MdtDb-Temp2.sql" -ServerInstance $MdtSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
            }
        }
        writeToLog("Done Creating ConfigMgr Portal Database logins.")

    }
    catch [Exception] {
        $ex = $_.Exception.Message
        writeError("Failed to create ConfigMgr Portal Database logins on DB '" + $CmpDatabaseName + "' on server '$CmpSqlServer': " + $ex)
    }
    
}



function setupAndUpdateWebConfigPortalFiles() {
    
    #Update the Portal's config file.
    writeToLog("Updating default site configuration files.")
    $configXmlFullName = $SiteRootPath + $SiteName + "\Configuration.xml"
    Copy-Item -Path "$InstallationFilesDir\Config\Configuration.xml" -Destination ("$configXmlFullName") -force
    
    replaceTokensInFile ($configXmlFullName) "%CMSiteServer%" $ConfigMgrSiteServer
    replaceTokensInFile ($configXmlFullName) "%CMSiteSQLServer%" $ConfigMgrSqlServer
    replaceTokensInFile ($configXmlFullName) "%CMSiteDatabaseName%" $ConfigMgrDatabaseName
    replaceTokensInFile ($configXmlFullName) "%CMPortalSQLServer%" $CmpSqlServer
    replaceTokensInFile ($configXmlFullName) "%CMPortalDatabaseName%" $CmpDatabaseName
    replaceTokensInFile ($configXmlFullName) "%CMPortalLicenseKey%" $LicenseKey
    replaceTokensInFile ($configXmlFullName) "%SysAdminGroup%" $CmpAdminGroup
    replaceTokensInFile ($configXmlFullName) "%CustomerKey%" $CustomerKey

    #SSRS Settings
    if ($EnableSsrsIntegration) {
        replaceTokensInFile ($configXmlFullName) "%SSRSServer%" $SsrsServerName
        replaceTokensInFile ($configXmlFullName) "%SSRSDBName%" $SsrsDatabaseName
    }
    else {
        replaceTokensInFile ($configXmlFullName) "%SSRSServer%" ""
        replaceTokensInFile ($configXmlFullName) "%SSRSDBName%" ""
    }

    if ($SsrsDbUseWinAuth) {
        replaceTokensInFile ($configXmlFullName) "%SSRSAuth%" "Windows"
        replaceTokensInFile ($configXmlFullName) "%SSRSLogin%" ""
        replaceTokensInFile ($configXmlFullName) "%SSRSPassword%" ""
    }
    else {
        replaceTokensInFile ($configXmlFullName) "%SSRSAuth%" "SQL"
        replaceTokensInFile ($configXmlFullName) "%SSRSLogin%" $SsrsSqlLogin
        replaceTokensInFile ($configXmlFullName) "%SSRSPassword%" $SsrsSqlPasswordHash
    }
    

    if ($CmpDbUseWinAuth) {
        replaceTokensInFile ($configXmlFullName) "%CMPAuthMode%" "Windows"
        replaceTokensInFile ($configXmlFullName) "%CMPDBUser%" ""
        replaceTokensInFile ($configXmlFullName) "%CMPDBPassword%" ""
    }
    else {
        replaceTokensInFile ($configXmlFullName) "%CMPAuthMode%" "SQL"
        replaceTokensInFile ($configXmlFullName) "%CMPDBUser%" $CmpSqlLogin
        replaceTokensInFile ($configXmlFullName) "%CMPDBPassword%" $CmpSqlPasswordHash
    }

    if ($ConfigMgrDbUseWinAuth) {
        replaceTokensInFile ($configXmlFullName) "%ConfigMgrAuthMode%" "Windows"
        replaceTokensInFile ($configXmlFullName) "%ConfigMgrDbUser%" ""
        replaceTokensInFile ($configXmlFullName) "%ConfigMgrDbPassword%" ""
    }
    else {
        replaceTokensInFile ($configXmlFullName) "%ConfigMgrAuthMode%" "SQL"
        replaceTokensInFile ($configXmlFullName) "%ConfigMgrDbUser%" $ConfigMgrSqlLogin
        replaceTokensInFile ($configXmlFullName) "%ConfigMgrDbPassword%" $ConfigMgrSqlPasswordHash
    }

    #Set MDT integration
    replaceTokensInFile ($configXmlFullName) "%EnableMdtIntegration%" $EnableMdtIntegration
	
	#Set MDT info if the integration is enabled.
    if ($EnableMdtIntegration) {
    if ($MdtDbUseWinAuth) {
        replaceTokensInFile ($configXmlFullName) "%MDTAuthMode%" "Windows"
        replaceTokensInFile ($configXmlFullName) "%MdtDbUser%" ""
        replaceTokensInFile ($configXmlFullName) "%MdtDbPassword%" ""
    }
    else {
        replaceTokensInFile ($configXmlFullName) "%MDTAuthMode%" "SQL"
        replaceTokensInFile ($configXmlFullName) "%MdtDbUser%" $MdtSqlLogin
        replaceTokensInFile ($configXmlFullName) "%MdtDbPassword%" $MdtSqlPasswordHash
    }

    #Setup MDT server information
    replaceTokensInFile ($configXmlFullName) "%MdtSqlServer%" $MdtSqlServer
    replaceTokensInFile ($configXmlFullName) "%MdtSqlDatabase%" $MdtDatabaseName
}
else {
    replaceTokensInFile ($configXmlFullName) "%MDTAuthMode%" "Windows"
    replaceTokensInFile ($configXmlFullName) "%MdtDbUser%" ""
    replaceTokensInFile ($configXmlFullName) "%MdtDbPassword%" ""
    replaceTokensInFile ($configXmlFullName) "%MdtSqlServer%" ""
    replaceTokensInFile ($configXmlFullName) "%MdtSqlDatabase%" ""
}

writeToLog("Reading content of 'configuration.xml' in $SiteRootPath$SiteName")
$content = Get-Content $configXmlFullName
writeToLog($content)

}

function startWindowsServices() {
    try {
        $services = Get-Service | Where-Object { $_.Name -eq "Cireson ConfigMgr Portal Hosting Service" -or $_.Name -eq ("Platform_$platformServiceName") }
        
        foreach ($service in $services) {
            if ($service.Status -eq "Stopped") {
                writeToLog ("Starting " + $service.Name)
                Start-Service -Name ($service.Name)
            }		
        }
    }
    catch [Exception] {
        $ex = $_.Exception.Message
        writeError("Failed to start services: " + $ex)
    }
}

function updateWindowsServiceConfig() {
    
    writeToLog "Updating default service configuration."
    $configMgrServiceWMI = get-wmiobject -query 'select * from win32_service where name="Cireson ConfigMgr Portal Hosting Service"'
    $servicePath = $configMgrServiceWMI.PathName
    try {
        if ($servicePath -ne $null) {
                      
            #Update the service account credentials for this service, which is using LocalSystem by default.
            #$servicepwss = $AppPoolPassword | ConvertTo-SecureString -AsPlainText -Force
            #$serviceCredentials = New-Object System.Management.Automation.PSCredential -ArgumentList $AppPoolUser, $servicepwss
            
            if ($UseLocalSystemAsServiceAccount) {
                writeToLog("Setting portal service to use LocalSystem logon.")
                $configMgrServiceWMI.Change($null,
                    $null,
                    $null,
                    $null,
                    $null,
                    $null,
                    $null, 
                    $null,
                    $null,
                    $null,
                    $null) | out-null
            }
            else {
                writeToLog("Setting portal service to use $ServiceUser logon.")
                grantLogonAsServiceToAccount($ServiceUser)
                # BEGIN CALLOUT C
                $configMgrServiceWMI.Change($null,
                    $null,
                    $null,
                    $null,
                    $null,
                    $null,
                    $ServiceUser, #$serviceCredentials.UserName,
                    $ServicePassword, #$serviceCredentials.GetNetworkCredential().Password,
                    $null,
                    $null,
                    $null) | out-null
                # END CALLOUT C

                addAccountToLocalAdministratorGroup($ServiceUser)
            }

        }
    }
    catch [Exception] {
        $ex = $_.Exception.Message
        writeError("Failed to update Windows service config: " + $ex)
    }
}

function addAccountToLocalAdministratorGroup($accountToAdd) {
    try {
		$computerFqdn = $env:computername + '.' + $env:userdnsdomain
		$dcServerRole = Get-WmiObject Win32_Computersystem | Where {$_.DomainRole -ge 4}
		$admingroupSID = "S-1-5-32-544" #support that the administrator group can have been renamed or localized
		if ($dcServerRole)
		{
			$splitCreds = $accountToAdd.Split("{\}")
			$domain = $splitCreds[0]
			$userName = $splitCreds[1]
			if (Get-Module -ListAvailable -Name 'ActiveDirectory') 
			{
				Import-Module ActiveDirectory
				$localAdminGroup = Get-ADGroup -Identity $admingroupSID
				$admingroupName = $localAdminGroup.Name
				$existingMember = Get-ADGroupMember -Identity $admingroupSID | Where {$_.Name -eq $userName}
			} 
			else 
			{
				$admingroupName = "Administrators"
			}			
		}
		else
		{
			$localAdminGroup = Get-LocalGroup -SID $admingroupSID
			$admingroupName = $localAdminGroup.Name
			$existingMember = Get-LocalGroupMember -SID $admingroupSID | Where {$_.Name -eq $accountToAdd}
		}
		
		if ($existingMember)
		{
			writeToLog($accountToAdd + " is already a member of the local " + $admingroupName + " group.")
		}
		else
		{
			writeToLog("Adding " + $accountToAdd + " to the local " + $admingroupName + " group.")
			if ($dcServerRole)
			{
				$splitCreds = $accountToAdd.Split("{\}")
				$domain = $splitCreds[0]
				$userName = $splitCreds[1]
				if (Get-Module -ListAvailable -Name 'ActiveDirectory') 
				{
					Add-ADGroupMember -Identity $admingroupSID -Members $userName
				}
				else
				{
					#old fashioned way
					$group = [ADSI]"WinNT://$env:COMPUTERNAME/Administrators,group"
					$members = @($group.psbase.Invoke("Members"))
			        $isMemberOf = ($members | foreach {$_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)}) -contains "$userName"
					if ($isMemberOf -eq $false) {
						$group.psbase.Invoke("Add", ([ADSI]"WinNT://$domain/$userName").path)
					}
				}
			}
			else
			{
				Add-LocalGroupMember -SID $admingroupSID -Member $accountToAdd
			}
			
		}
    }
    catch [Exception] {
        writeWarning("Unable to add the user " + $accountToAdd + " to the local built-in administrator group. Exception: " + $_.Exception.Message)
    }
}


function grantLogonAsServiceToAccount($accountToAdd) {
    #written by Ingo Karstein, http://blog.karstein-consulting.com
    #  v1.0, 01/03/2014

	writeToLog ("Attempting to grant 'Logon as a Service' rights to ' " + $accountToAdd + "'.")
    $sidstr = $null
    try {
        $ntprincipal = new-object System.Security.Principal.NTAccount "$accountToAdd"
        $sid = $ntprincipal.Translate([System.Security.Principal.SecurityIdentifier])
        $sidstr = $sid.Value.ToString()
    }
    catch [Exception] {
        writeError("Account $accountToAdd not found.  Exception: " + $ex)
        return
    }


    $tmp = [System.IO.Path]::GetTempFileName()

    writeToLog ("Verifying Local Security Policy for '$accountToAdd'.")
    secedit.exe /export /cfg "$($tmp)" 

    $c = Get-Content -Path $tmp 

    $currentSetting = ""

    foreach ($s in $c) {
        if ( $s -like "SeServiceLogonRight*") {
            $x = $s.split("=", [System.StringSplitOptions]::RemoveEmptyEntries)
            $currentSetting = $x[1].Trim()
        }
    }

    if ( $currentSetting -notlike "*$($sidstr)*" ) {
        #writeToLog "Modify Setting ""Logon as a Service"""
	
        if ( [string]::IsNullOrEmpty($currentSetting) ) {
            $currentSetting = "*$($sidstr)"
        }
        else {
            $currentSetting = "*$($sidstr),$($currentSetting)"
        }
	
        #writeToLog "$currentSetting"
	
        $outfile = @"
[Unicode]
Unicode=yes
[Version]
signature="`$CHICAGO`$"
Revision=1
[Privilege Rights]
SeServiceLogonRight = $($currentSetting)
"@

        $tmp2 = [System.IO.Path]::GetTempFileName()
	
        $outfile | Set-Content -Path $tmp2 -Encoding Unicode -Force | out-null

        #notepad.exe $tmp2
        Push-Location (Split-Path $tmp2)
	
        try {
			writeToLog ("Running secedit.exe to set the right.")
            secedit.exe /configure /db "secedit.sdb" /cfg "$($tmp2)" /areas USER_RIGHTS | Out-Null
            #write-host "secedit.exe /configure /db ""secedit.sdb"" /cfg ""$($tmp2)"" /areas USER_RIGHTS "
        }
        finally {	
            Pop-Location
        }
    }
    else {
        writeToLog ($accountToAdd + " already holds the Logon as a Service right.")
    }
}

function uninstallWindowsService() {
    try {
        
        $configMgrService = get-wmiobject -query 'select * from win32_service where name="Cireson ConfigMgr Portal Hosting Service"'
        #$configMgrService = Get-Service -Name "Cireson ConfigMgr Portal Hosting Service" -ErrorAction Continue
        if ($configMgrService -ne $null) {
            writeToLog "Obtaining existing Cireson Hosting Service"
            $cmpService = Get-WmiObject -Class Win32_Product -Filter "Name = 'Cireson ConfigMgr Portal Service'" #Takes a few seconds...
            foreach ($thisApp in $cmpService) {
                writeToLog "Uninstalling $($thisApp.Name) v$($thisApp.Version)."
                Start-Process "msiexec.exe" -arg ("/X" + $thisApp.IdentifyingNumber + " /qn") -Wait
            }
        }
        
    }
    catch [Exception] {
        $ex = $_.Exception.Message
        writeError("Failed to uninstall windows service: " + $ex)
    }
}

function installWindowsService() {
    try {
        
        $configMgrService = get-wmiobject -query 'select * from win32_service where name="Cireson ConfigMgr Portal Hosting Service"'
        #$configMgrService = Get-Service -Name "Cireson ConfigMgr Portal Hosting Service" -ErrorAction Continue
        if ($configMgrService -eq $null) {
            writeToLog ("Installing Cireson Hosting Service")
            $msiInstallerFullName = $InstallationFilesDir + "\ServiceInstallers\Cireson ConfigMgr Portal Service x64.msi"
            if ((Get-WmiObject Win32_OperatingSystem).OSArchitecture -eq "32-bit") {
                #OS is x86
                $msiInstallerFullName = $InstallationFilesDir + "\ServiceInstallers\Cireson ConfigMgr Portal Service x86.msi"
            }
            
            Start-Process "msiexec.exe" -arg "/i `"$msiInstallerFullName`" /qn CMPFOLDER=$SiteRootPath$SiteName DEPLOYMENT_PORT=$DeploymentServicePort CACHING_PORT=$CacheServicePort" -Wait
        }
        else {
            writeToLog ("Cireson ConfigMgr Portal Hosting Service already exists.")
        }
        
    }
    catch [Exception] {
        $ex = $_.Exception.Message
        writeError("Failed to install Cireson ConfigMgr Portal Hosting Service: " + $ex)
    }
}

function backupParametersXmlFile() {
    #we need to replace a token in the web deploy parameter file before deploying it, but we don't
    #want to overwrite the original in case the user executes it again with a different site name.
    #So we'll save the original on the first run, and copy it in subsequent runs.
    if ((Test-Path -Path "website\ConfigMgrPortal.UI.SetParameters.xml.config") -ne $true) {
        writeToLog ("Creating base config")
        Copy-Item -Path "$CurrentDirectory\website\ConfigMgrPortal.UI.SetParameters.xml" -Destination "$CurrentDirectory\website\ConfigMgrPortal.UI.SetParameters.xml.config"
    }

    Copy-Item -Path "$CurrentDirectory\website\ConfigMgrPortal.UI.SetParameters.xml.config" -Destination "$CurrentDirectory\website\ConfigMgrPortal.UI.SetParameters.xml"

}
function restoreParametersXmlFile() {
    #we need to replace a token in the web deploy parameter file before deploying it, but we don't
    #want to overwrite the original in case the user executes it again with a different site name.
    #So we'll save the original on the first run, and copy it in subsequent runs.
    if ((Test-Path -Path "$CurrentDirectory\website\ConfigMgrPortal.UI.SetParameters.xml.config") -eq $true) {
        writeToLog ("Restoring base config")
        Copy-Item -Path "$CurrentDirectory\website\ConfigMgrPortal.UI.SetParameters.xml.config" -Destination "$CurrentDirectory\website\ConfigMgrPortal.UI.SetParameters.xml"
    }
}

function isCNameDnsRecordRegistered([string] $cnameRecord, [string] $dnsServer, [string] $zoneName)
	{
		try
		{
			$dnsServerZone = Get-DnsServer -ComputerName $dnsServer -WarningAction Ignore | Select-Object -ExpandProperty ServerZone | Where-Object{$_.ZoneName -eq $zoneName} 
			if ($dnsServerZone -ne $null)
			{
				try
				{
					$dnsRecordEntry = Get-DnsServerResourceRecord -Name $cnameRecord -ZoneName $dnsServerZone.ZoneName -RRType CName -ComputerName $dnsServer -ErrorAction Stop
					if ($dnsRecordEntry.HostName -eq $cnameRecord)
					{
						return $true
					}
					else
					{
						return $false
					}
				}
				catch 
				{
					return $false
				}
			}
			return $false
		}
		catch
		{
			write-host ($_.Exception.Message)
		}
	}

function installConfigMgrPortalWebsite() {
    writeToLog ("Setting up IIS Site and Application pool...")
    #Setup initial website app pool, and site.
    #if the site already exists, then do not create it.
    Import-Module "ServerManager"
    Import-Module "WebAdministration"

    if (!(Get-Module "ServerManager")) {
        writeWarning("ServerManager Powershell cmdlets did not seem to load.  This does not mean the install has failed.  Please check for other errors.")
    }

    if (!(Get-Module "WebAdministration")) {
        writeWarning("WebAdministration Powershell cmdlets did not seem to load.  This does not mean the install has failed.  Please check for other errors.")
    }

    if ((Test-Path IIS:\AppPools\$SiteName) -eq $false) {
        $appPool = New-Item IIS:\AppPools\$SiteName
    }
    else {
        #Replace existing apppool identity.
        $appPool = Get-Item IIS:\AppPools\$SiteName
    }

    writeToLog("Configuring IIS Application Pool.")
	writeToLog("Configuring IIS Application Pool identity to use custom account " + $AppPoolUser)
    $appPool.processModel.username = $AppPoolUser
    $appPool.processModel.password = $AppPoolPassword
    $appPool.processModel.identityType = 3
	$appPool.processModel.idleTimeout = [TimeSpan]::FromMinutes(0)
    $appPool.recycling.periodicRestart.time = [TimeSpan]::FromMinutes(0)

	writeToLog("Commiting IIS Application Pool settings.")
    $appPool | set-item 

    writeToLog("Configuring IIS Application Pool recycling properties. Will recycle at midnight.")   
	Clear-ItemProperty IIS:\AppPools\$SiteName -Name Recycling.periodicRestart.schedule
    New-ItemProperty -Path "IIS:\AppPools\$SiteName" -Name Recycling.periodicRestart.schedule -Value @{value = ("00:00")}

	$website = Get-WebSite | where-object { $_.name -eq $SiteName }
    if ($website -eq $null) {
        writeToLog("Configuring new Web Site '" + $SiteName + "'.")
		writeToLog("Setting Web Site bindings to " + $SitePort + ":" + $Hostname)
		writeToLog("Setting Web Site physical path to " + $SiteRootPath + $SiteName)
        New-Item IIS:\Sites\$SiteName -physicalPath ($SiteRootPath + $SiteName) -bindings @{protocol = "http"; bindingInformation = ":" + $SitePort + ":" + $Hostname}
        writeToLog("Configuring Web Site to use configured Application Pool.")
		writeToLog("Commiting Web Site settings.")
		Set-ItemProperty IIS:\Sites\$SiteName -name applicationPool -value $SiteName
    }
    else {
        writeToLog("Checking/reconfiguring existing Web Site '" + $SiteName + "'.")
        $bindings = $website.Bindings
        if ($bindings.Collection.bindingInformation -notcontains ("*:" + $SitePort + ":" + $Hostname) -and `
            $bindings.Collection.bindingInformation -notcontains (":" + $SitePort + ":" + $Hostname)) 
        {
            writeToLog("Setting IIS Website binding info ':" + $SitePort + ":" + $Hostname + "'")
            New-ItemProperty -Path IIS:\Sites\$SiteName -Name bindings -Value @{protocol = "http"; bindingInformation = ":" + $SitePort + ":" + $Hostname}
        }
        if ($website.physicalPath -ine $SiteRootPath + $SiteName)
        {
		    writeToLog("Changing Web Site physical path to " + $SiteRootPath + $SiteName)
            Set-ItemProperty IIS:\Sites\$SiteName -Name physicalPath -Value ($SiteRootPath + $SiteName)
        }
    }


    #Setup https if a cert is specified
	writeToLog("Checking SSL Certificate settings")
    if (-not ([string]::IsNullOrEmpty($SSLCertificateName)))
	{
        try {
			writeToLog("Configuring SSL. Certificate Name '" + $SSLCertificateName + "'.")
            #Add https binding
	        writeToLog("Adding https binding.")
			if (-not ([string]::IsNullOrEmpty($Hostname))) 
			{ 
				New-WebBinding -Name $SiteName -IPAddress "*" -Protocol "https" -Port $HttpsListenerPort -HostHeader $Hostname -SslFlags 1
			}
			else
			{
				New-WebBinding -Name $SiteName -IPAddress "*" -Protocol "https" -Port $HttpsListenerPort -SslFlags 1
			}

            #Add certificate
			writeToLog("Adding certificate " + $SSLCertificateName )
            $cert = (Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object { $_.FriendlyName -match ("$SSLCertificateName") } | Select-Object -First 1)
            $cert | New-Item IIS:\SslBindings\0.0.0.0!$HttpsListenerPort
        }
        catch [Exception] {
            $ex = $_.Exception.Message
            $exInner = ""
            if ($_.Exception.InnerException.Message -ne $null) {
                $exInner = $_.Exception.InnerException.Message
            };
			
            if ($ex -notlike '*already exists*') {
                writeError("Failed to configure SSL on " + $SiteName + ": " + $ex + " " + $exInner)
            }
        }
    }
	else
	{
		writeToLog("No SSL Certificate was specified, skipping.")
	}

	#add hostname to DNS server
	if ($AddHostNameToDns -eq $true)
	{
		writeToLog ("Registering " + $Hostname + " in DNS")
		if ($env:userdnsdomain -ne '') 
		{
			$removeRsatDns = $false
			#check if we have DNS powershell feature installed
			$dnsFeature = Get-WindowsFeature "RSAT-DNS-Server"
			if(! $dnsFeature.Installed){
				try
				{
					$featureInstallState = install-WindowsFeature "RSAT-DNS-Server"
					$removeRsatDns = $true
				}
				catch [Exception]
				{
				   $ex = $_.Exception.Message
					writeWarning ("Please add the DNS record '" + $Hostname +"' manually. (Failed to install DNS Server Tools feature: " + $ex + ")")
				}
			}

			if (Get-Module -ListAvailable -Name DnsServer) 
			{
				$dnsServerAddress = ""
				$dnsServerAddresses = Get-DnsClientServerAddress | Where-Object {$_.InterfaceAlias -eq 'Ethernet' -and $_.AddressFamily -eq 2} | Select-Object –ExpandProperty ServerAddresses
				if ($dnsServerAddresses.length -ge 1)
				{
					$dnsServerAddress = $dnsServerAddresses[0] #get the primary DNS
				}
				if ($dnsServerAddress -ne '')
				{
					$recordExists = isCNameDnsRecordRegistered -dnsServer $dnsServerAddress -cnameRecord $Hostname -zoneName $env:userdnsdomain
					if ($recordExists -ne $true)
					{
						try
						{
							$dnsServerZone = Get-DnsServer -ComputerName $dnsServerAddress -WarningAction Ignore | Select-Object -ExpandProperty ServerZone | Where-Object{$_.ZoneName -eq $env:userdnsdomain -and $_.ZoneType -eq "Primary"} 
							if ($dnsServerZone -ne $null)
							{
								writeToLog ($Hostname + "does not exist in DNS, adding it.")
								Add-DnsServerResourceRecordCName -ComputerName $dnsServerAddress -Name $Hostname -HostNameAlias ($env:COMPUTERNAME + "." + $env:userdnsdomain) -ZoneName $dnsServerZone.ZoneName
								writeToLog ("Flushing local DNS client cache")
								Clear-DnsClientCache
							}
							else
							{
								writeWarning ("Please add the DNS record '" + $Hostname +"' manually. (An expected primary DNS zone named " + $env:userdnsdomain + " on server " + $dnsServerAddress + " could not be found)")
							}
						}
						catch
						{
							writeWarning ("Please add the DNS record '" + $Hostname +"' manually. (" + $_.Exception.Message + ")")
						}
					}
					else
					{
						writeToLog ("A record for '" + $Hostname + "' is already registered in DNS.")
					}
				}
				else
				{
					writeWarning ("Please add the DNS record '" + $Hostname +"' manually. (No DNS server address could be found on this computer)")
				}
			}
			else
			{
				writeWarning ("please add the DNS record '" + $Hostname +"' manually. (DNS PowerShell module is not installed, enabled or requires a reboot)")
			}
			if ($removeRsatDns -eq $true)
			{
				$dnsFeature = Get-WindowsFeature "RSAT-DNS-Server"
				if($dnsFeature.Installed){
					try
					{
						Uninstall-WindowsFeature "RSAT-DNS-Server"					
					}
					catch [Exception]
					{
					   $ex = $_.Exception.Message
						writeWarning ("Failed to uninstall DNS Server Tools feature: " + $ex)
					}					
				}
			}
		}	
	}
	else
	{
		writeToLog ("Hostname is not automatically being registered.")
	}

	
    backupParametersXmlFile
    #Setup ParameterFile to deploy to the proper location
    replaceTokensInFile ("website\ConfigMgrPortal.UI.SetParameters.xml") "%SiteName%"  $SiteName
    writeToLog("Deploying the website...")
    Invoke-Expression  "website\ConfigMgrPortal.UI.deploy.cmd /Y" | Write-Output
    writeToLog("Deploying website is complete.")

    writeToLog("Setting modify permssions for $AppPoolUser on $SiteName.")
    $acl = Get-Acl -Path ($SiteRootPath + $SiteName)
    $newAcl = $AppPoolUser, "Modify", "ContainerInherit,ObjectInherit", "None", "Allow"
    $accessRule = new-object System.Security.AccessControl.FileSystemAccessRule $newAcl
    $acl.AddAccessRule($accessRule)
    $acl | Set-Acl -Path ($SiteRootPath + $SiteName)

    restoreParametersXmlFile

}

function startWebSite() {
    try {
        writeToLog ("Starting website: $SiteName.")
        Start-WebSite -Name $SiteName

        writeToLog ("Started website: $SiteName.")
				
    }
    catch [Exception] {
        $ex = $_.Exception.Message
        $exInner = ""
        if ($_.Exception.InnerException.Message -ne $null) {
            $exInner = $_.Exception.InnerException.Message
        };
					
        writeError("Failed to start website: " + $SiteName + ": " + $ex + " " + $exInner)
    }
}


function configureAuthentication {
    writeToLog("Configuring Windows authentication.")
    Set-WebConfiguration system.web/authentication "IIS:\sites\$SiteName" -value @{mode = "Windows"}
    Set-WebConfigurationProperty -Location $SiteName -filter /system.webServer/security/authentication/windowsAuthentication -name enabled -value true -PSPath IIS:\
    Set-WebConfigurationProperty -Location $SiteName -filter /system.WebServer/security/authentication/AnonymousAuthentication -name enabled -value false 
    writeToLog("Done Configuring Windows Authentication method.")
		
}

function installCommence {
    if ((Test-Path $InstallationFilesDir\Commence\x86\Commence.cab) -and (Test-Path $InstallationFilesDir\Commence\x64\Commence.cab)) {
        New-Item $SiteRootPath$SiteName\Commence -Type Directory -Force
        #Setup anonymous access perms
        Set-WebConfigurationProperty  -filter /system.WebServer/security/authentication/AnonymousAuthentication -name enabled -value true -Location "$SiteName/Commence" -PSPath IIS:\
        Set-WebConfigurationProperty  -filter /system.webServer/security/authentication/windowsAuthentication -name enabled -value false -Location "$SiteName/Commence" -PSPath IIS:\

        $x86Commence = "$SiteRootPath$SiteName\Commence\x86"
        writeToLog("Installing Commence x86 to $x86Commence")
        New-Item $x86Commence -Type Directory -Force

        #Copy files
        Copy-Item $InstallationFilesDir\Commence\x86\*.* $x86Commence

        writeToLog("Writing 'settings.cnf' for Commence x86 to $x86Commence")
        Copy-Item -Path "$InstallationFilesDir\Config\settings.cnf" -Destination ("$x86Commence") -force
		
        $fqdn = (Get-WmiObject win32_computersystem).DNSHostName + "." + (Get-WmiObject win32_computersystem).Domain
        replaceTokensInFile ($x86Commence + "\settings.cnf") "%FQDN%" $fqdn
        replaceTokensInFile ($x86Commence + "\settings.cnf") "%DeploymentServicePort%" $DeploymentServicePort

        writeToLog("Reading content of 'settings.cnf' in $x86Commence")
        $content = Get-Content "$x86Commence\settings.cnf"
        writeToLog($content)
        writeToLog("Commence x86 installation complete.")

        $x64Commence = "$SiteRootPath$SiteName\Commence\x64"
        writeToLog("Installing Commence to $x64Commence")
        New-Item $x64Commence -Type Directory -Force

        #Copy files
        Copy-Item $InstallationFilesDir\Commence\x64\*.* $x64Commence

        writeToLog("Writing 'settings.cnf' for Commence x64 to $x64Commence")
        Copy-Item -Path "$InstallationFilesDir\Config\settings.cnf" -Destination ("$x64Commence") -force
		
        $fqdn = (Get-WmiObject win32_computersystem).DNSHostName + "." + (Get-WmiObject win32_computersystem).Domain

        replaceTokensInFile ($x64Commence + "\settings.cnf") "%FQDN%" $fqdn
        replaceTokensInFile ($x64Commence + "\settings.cnf") "%DeploymentServicePort%" $DeploymentServicePort

        writeToLog("Reading content of 'settings.cnf' in $x64Commence")
        $content = Get-Content "$x64Commence\settings.cnf"
        writeToLog($content)

        writeToLog("Commence x64 installation complete.")
    }

}

function performUpgradeActions {
    writeToLog "Performing upgrade actions on the Control Center database..."
    foreach ($file in Get-ChildItem -Path $InstallationFilesDir\UpgradeScripts) {
        $fileName = $file.Name
        Copy-Item -Path "$InstallationFilesDir\UpgradeScripts\$fileName" -Destination "$InstallationFilesDir\UpgradeScripts\$fileName.tmp" -force

        replaceTokensInFile "$InstallationFilesDir\UpgradeScripts\$fileName.tmp" "%CMPDB%" $CmpDatabaseName
        writeToLog "Executing '$fileName' upgrade script on '$CmpDatabaseName'..."
        Invoke-Sqlcmd -InputFile "$InstallationFilesDir\UpgradeScripts\$fileName.tmp" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
    }

}

function stopRunningServices {
    $cmpHostServices = Get-Service | Where-Object { $_.Name -eq "Cireson ConfigMgr Portal Hosting Service" -or $_.Name -eq ("Platform_$platformServiceName") }

    foreach ($service in $cmpHostServices) {
        Stop-Service -Name $service.Name
    }
}

function restartPlatformService {
	writeToLog("Restarting Platform service.")
    $platformServices = Get-Service | Where-Object { $_.Name -eq "Platform_$platformServiceName"}
    foreach ($platformService in $platformServices) {
		Restart-Service -Name $platformServices.Name
    }
}

function waitForPlatformInit {
	$isServiceRunning = $false
    $platformServices = Get-Service | Where-Object { $_.Name -eq "Platform_$platformServiceName"}
    foreach ($platformService in $platformServices) {
		if ($platformServices.Status -eq 'Running')
        {
            $isServiceRunning = $true
        }
    }
	if ($isServiceRunning -eq $true)
	{
		$iterations = 0
		$dataReturned = $false
		Do{
			try
			{
				$tmp = Get-CPEXApiEndpoints -platformRootUri $PlatformRootUri
                $dataReturned = $true
			}		   
			 catch [Exception] 
			{
				$iterations++
			    sleep 2
			}			
		}
		Until (($dataReturned -eq $true) -or ($iterations -cge 60))
		return $dataReturned
	}
}


#Check EULA
if ($AcceptEula -eq $false) {
    #$eulaText = Get-Content -Path "eula/eula.rtf"
    writeWarning "You must accept the End User License Agreement to install this product."
    #writeWarning $eulaText
    Invoke-Expression "start $InstallationFiles\eula\eula.rtf" 
    return
}

$ErrorActionPreference = "Stop"

#Begin Installation Procecedures
writeProgress(1);
writeToLog("Preparing to install, please wait...")
$PoshVersion = $host.Version
writeToLog("Install script is running under PowerShell v$PoshVersion")
Set-Location $PSScriptRoot  

#Check for CPEX core version
if ($PlatformCPEXAppVersion -eq $null) {
    if (!(Test-Path -Path $PSScriptRoot\CpexVersion.json)) {
		writeError -error "No CPEX version parameter set and CpexVersion.json file was not found in the script root."
    }

    $json = Get-Content -Path $PSScriptRoot\CpexVersion.json | ConvertFrom-Json
    if (!($json.PSobject.Properties.Name -contains "CpexVersion") -or [string]::IsNullOrEmpty($json.CpexVersion)) {
        writeError -error "No CPEX version parameter set and the CpexVersion.json file does not contain a 'CpexVersion' property, or the property is empty."
	}
	
	$PlatformCPEXAppVersion = $json.CpexVersion
	writeToLog("Installing CMP.Core version $PlatformCPEXAppVersion...")
}

#Data
if ($InstallDatabase) {

    try {
        Push-Location
        writeToLog "Preparing SQL Connection..."
        #force reload PSModulePath environment variable.  The MSI containing sqlps modifies the variable but requires a restart of the session to take effect.  This forces it.
        $env:PSModulePath = [Environment]::GetEnvironmentVariable("PSModulePath", "Machine")
        Import-Module "sqlps" -DisableNameChecking
        Pop-Location #Need this to get out of the SQLProvider drive.
        writeToLog "sqlps - enabled."
    }
    catch {
        writeError("Could not load sqlps powerscript tools. Please install PowerShellTools.MSI" )
    }

    writeToLog("Stopping running services...")
    stopRunningServices

    writeProgress(15)

    if ($IsUpgradeScenario -eq $false) {
        #build DB and management packages
        deployManagementDatabase
    }

    writeProgress(25)
    createSQLLogins

    writeProgress(40)
    deployManagementSqlTablesAndData

    if ($IsUpgradeScenario -eq $true) {
        #Execute any upgrade script that needs to be applied to the database.
        performUpgradeActions
    }
	
}
else {
    writeProgress(40);
    writeToLog("Database install skipped.");
}

if ($InstallServices) {
    if ($IsUpgradeScenario -eq $true) {
        #Uninstall the windows service first so it does not interfere with the install. if it's installed.
        writeProgress(45)
        uninstallWindowsService
    }

    writeProgress(55)
    installWindowsService

    writeProgress(65)
    updateWindowsServiceConfig
}
else {
    writeProgress(65);
    writeToLog("Services install skipped.");
}

if ($InstallWebsite) {
    writeProgress(70);
    installConfigMgrPortalWebsite

    writeProgress(80);
    setupAndUpdateWebConfigPortalFiles

    writeProgress(85);
    configureAuthentication
    installCommence

    startWebSite	
}
else {
    writeProgress(85);
    writeToLog("Website install skipped.");
}

writeProgress(90)

installPlatform

writeToLog("Starting Services...")
startWindowsServices

writeProgress(100)
sleep 10
writeToLog "Installation complete."
