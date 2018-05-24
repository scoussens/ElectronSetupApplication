param(
    $SiteRootPath,
    $SiteName
)

$platformInstallPath = $SiteRootPath + $SiteName + "\Platform"

# if (isOfflineInstall) {
#     writeToLog("Offline mode, importing module 'Cpexlets.psm1'") 
#     Import-Module "./OfflineCpex/Cpexlets.psm1" -Force 
#     writeToLog("Module 'Cpexlets.psm1' imported") 
# }
# else {
    #Register Platform cmdlet feed
    writeToLog("Setting up environment for Cireson Platform installation...") 
    $env:PSModulePath = $env:PSModulePath + "; $env:ProgramFiles\WindowsPowerShell\Modules"  #For some reason this path is not added to the user env variables.
    Import-Module PackageManagement

    Register-PackageSource "https://cireson.myget.org/F/public/api/v2" -Name CiresonDevelopmentFeed -Trusted -ProviderName PowerShellGet -ForceBootstrap -Force -ErrorAction SilentlyContinue
    writeToLog("Install CpexLets module and connect to the Cireson MyGet feed.")
    Remove-Module -Name Cpexlets -Force -ErrorAction SilentlyContinue
    Install-Module -Name CpexLets -Force
    Connect-CPEXFeed -feedName public
# }

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
$appSettings += "{`"ConfigMgrSiteServer`":`"$ConfigMgrSiteServer`",`"ConfigMgrUserName`":`"$user`",`"ConfigMgrPassword`":`"$configMgrAdapterPassword`"}"

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
$appSettings += "{`"LdapPath`":`"$Ldap`",`"Domain`":`"$domain`",`"UserName`":`"$userName`",`"Password`":`"$adAdapterPassword`"}"

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
    }
    else
    {
        writeToLog("No account was specified for Remote Manage execution.")
    }
}

$appSettings += "{`"Domain`":`"$domain`",`"UserName`":`"$userName`",`"Password`":`"$RemoteManageServicePassword`",`"UseWinAuth`":`"$UseWinAuthForRemoteManage`"}"

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
    -additionalAppSettings $appSettings


writeToLog("Installing the Cireson Platform...");
#Install platform
if ($UseAppPoolAsPlatformServiceAccount) {
    writeToLog("Using $AppPoolUser to install the platform...");
    addAccountToLocalAdministratorGroup($AppPoolUser)
    if (isOfflineInstall) {
        Get-CPEXPlatformConfig -path $platformInstallPath\CMP_Platform.config | Install-CPEXOfflineInstallerPackage -installationMediaPath ".\OfflineCpex\" -serviceUser $AppPoolUser -servicePassword $AppPoolPassword
    }
    else {
        Get-CPEXPlatformConfig -path $platformInstallPath\CMP_Platform.config | Install-CPEXPlatform -serviceUser $AppPoolUser -servicePassword $AppPoolPassword
    }
}
else {
    writeToLog("Using $PlatformServiceUser to install the platform, and adding user to local administrators group...");
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