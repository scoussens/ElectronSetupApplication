param(
	[string]$applicationName = "Cireson.ConfigurationManager.Portal.Core",
	[string]$PlatformCPEXAppVersion = $null,
	[string]$installationFilesPath = $PSScriptRoot
)

function writeError([string]$error) {
	throw $error
}

function writeLog([string]$message) {
	Write-Output($message)
}

Add-Type -AssemblyName PresentationFramework

if ([System.Version]$PSVersionTable.PSVersion -lt [System.Version]"5.1.0.0")
{
	writeLog("Windows Management Framework 5.1 or greater is not installed.") 
	[System.Windows.MessageBox]::Show('To create an offline media of Control Center, Microsoft Management Framework 5.1 or greater is required.','Windows Management Framework 5.1 is not installed','Ok','Warning')
    Start-Process "https://www.microsoft.com/en-us/download/details.aspx?id=54616"
	Exit
}

writeLog("Setting up environment for Cireson Platform Offline installation...") 
writeLog("Expanding PSModulePath environment.")
$env:PSModulePath = $env:PSModulePath + "; $env:ProgramFiles\WindowsPowerShell\Modules"  #For some reason this path is not added to the user env variables.
writeLog("Importing required PowerShell module 'PackageManagement'.")
Import-Module PackageManagement
writeLog("Registering Package Source https://cireson.myget.org/F/public/api/v2.")
Register-PackageSource -Location "https://cireson.myget.org/F/public/api/v2" -Name CiresonPublicFeed -Trusted -ProviderName PowerShellGet -ForceBootstrap -Force -ErrorAction SilentlyContinue

writeLog("Removing any existing local CpexLets modules.")
Remove-Module -Name CpexLets -Force -ErrorAction SilentlyContinue
writeLog("Installing CpexLets module.")
Install-Module -Name CpexLets -Force

#Create a temp folder, and run the offline installation build process.
$tempFolder = "$env:TEMP\Cireson Control Center Offline Installer Work Folder"
$tempZipFolder = "$env:TEMP\Cireson Control Center Offline Installer"
$tempZip = "$env:TEMP\Cireson Control Center Offline Installer\ControlCenter-Offline.zip"

if ($PlatformCPEXAppVersion -eq $null -or [string]::IsNullOrEmpty($PlatformCPEXAppVersion) -eq $true) {
    if (!(Test-Path -Path $PSScriptRoot\CpexVersion.json)) {
		writeError -error "No CPEX version parameter set and CpexVersion.json file was not found in the script root."
    }

    $json = Get-Content -Path $PSScriptRoot\CpexVersion.json | ConvertFrom-Json
    if (!($json.PSobject.Properties.Name -contains "CpexVersion") -or [string]::IsNullOrEmpty($json.CpexVersion)) {
        writeError -error "No CPEX version parameter set and the CpexVersion.json file does not contain a 'CpexVersion' property, or the property is empty."
	}
	
	$PlatformCPEXAppVersion = $json.CpexVersion
	writeLog("Installing CMP.Core version $PlatformCPEXAppVersion...")
}

writeLog("Executing CPEX CmdLet 'New-CPEXOfflineInstallerPackage'")
New-CPEXOfflineInstallerPackage -applicationName $applicationName -applicationVersion $PlatformCPEXAppVersion -outputPath "$tempFolder\OfflineCpex"
writeLog("Removing any old zip files from " + $tempFolder + "\OfflineCpex")
Remove-Item "$tempFolder\OfflineCpex\*.zip" #remove the default zip as we will recreate it with the additional installer files.

#download PreReqs
function downloadFiles([String]$url, [String]$destination)
{
	try{
		if(test-path $destination) {
			writeLog ("File '" + $destination + " already exists, will not attempt download.");
			return 
		}

		writeLog ("Downloading files from Microsoft: $url")
		(New-Object System.Net.WebClient).DownloadFile($url, $destination)
	}catch [Exception]{
		$ex = $_.Exception.Message
        writeLog ("Failed to download files: " + $ex)
	}
}

$downloadDir = "$installationFilesPath\InstallationFiles\Microsoft"
downloadFiles "https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win7AndW2K8R2-KB3191566-x64.zip" "$downloadDir\Win7AndW2K8R2-KB3191566-x64.zip"
downloadFiles "https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/W2K12-KB3191565-x64.msu" "$downloadDir\W2K12-KB3191565-x64.msu"
downloadFiles "https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win8.1AndW2K12R2-KB3191564-x64.msu" "$downloadDir\Win8.1AndW2K12R2-KB3191564-x64.msu"
downloadFiles "https://download.microsoft.com/download/F/9/4/F942F07D-F26F-4F30-B4E3-EBD54FABA377/NDP462-KB3151800-x86-x64-AllOS-ENU.exe" "$downloadDir\NDP462-KB3151800-x86-x64-AllOS-ENU.exe" #.net 6.2

#nuget packages
$localNugetPath = "$installationFilesPath\InstallationFiles\Microsoft"
Register-PackageSource -Location $localNugetPath -ProviderName Nuget -Name LocalNuget
writeLog ("Downloading Nuget package 'Microsoft.SqlServer.SqlManagementObjects' to " + $localNugetPath)
Save-Package -Name "Microsoft.SqlServer.SqlManagementObjects" -Source Nuget -Path $localNugetPath
writeLog ("Downloading Nuget package 'Microsoft.Web.Deployment' to " + $localNugetPath)
Save-Package -Name "Microsoft.Web.Deployment" -Source Nuget -Path $localNugetPath
writeLog ("Downloading Nuget package 'Microsoft.SqlServer.Types' to " + $localNugetPath)
Save-Package -Name "Microsoft.SqlServer.Types" -Source Nuget -Path $localNugetPath
writeLog ("Downloading Nuget package 'Microsoft.SqlServer.TransactSql.ScriptDom' to " + $localNugetPath)
Save-Package -Name "Microsoft.SqlServer.TransactSql.ScriptDom" -Source Nuget -Path $localNugetPath
writeLog ("Downloading PowerShell package 'SqlServer' to " + $localNugetPath)
Save-Package -Name "SqlServer" -ProviderName PowerShellGet -Path $localNugetPath

writeLog ("Copying files to '" + $tempFolder + "'")
Copy-Item "$installationFilesPath\*" $tempFolder -Recurse -Force
#Create zip file from tempFolder

[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
writeLog ("Removing '" + $tempZip + "' if it exists.")
Remove-Item "$tempZip" -Force -ErrorAction SilentlyContinue
writeLog ("Creating folder '" + $tempZipFolder + "'")
New-Item -ItemType Directory -Path "$tempZipFolder" -Force -ErrorAction SilentlyContinue

writeLog ("Compressing '" + $tempFolder + "' to '" + $tempZip + "'")
[System.IO.Compression.ZipFile]::CreateFromDirectory($tempFolder, $tempZip)

writeLog ("Removing work folder '" + $tempFolder + "'")
Remove-Item "$tempFolder" -Force -Recurse -ErrorAction SilentlyContinue

set-content "$tempZipFolder\readme.txt" -Value "`
To install this product, copy the ControlCenter-Offline.zip file to the airgapped, or offline server
Extract it to a convenient folder
Run Setup.exe
Install as you normally would
"

[System.Windows.MessageBox]::Show('To install Control Center on an internet disconnected server, copy the ControlCenter-Offline.zip to the server, extract it and run Setup. Click OK to open the file location','Control Center Offline media created','Ok','Information')

#Open an explorer window to the offline.zip folder.
explorer $tempZipFolder
	
