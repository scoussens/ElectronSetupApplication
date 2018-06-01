#----------------------------------------------
#-------- ConfigMgr Portal Installer ----------
#----------------------------------------------
# v2017.10.18.1
#Description: Installs the Cireson Configuration Manager Portal Prereq Script

$pctComplete=0
$LogFilePath = (${env:Temp} + "\CiresonInstall" + (Get-Date -format "yyyy-MM-dd-hh-mm-ss") + ".log")
$OSVersion = (Get-WmiObject win32_operatingsystem).version
$CurrentDirectory = (Split-Path $script:MyInvocation.MyCommand.Path)
$downloadDir = "$CurrentDirectory\InstallationFiles\Microsoft"
$installedProducts = @{}
$preReqStatus = @{}
[System.Collections.ArrayList]$features = @("Web-Server", "Web-Mgmt-Tools", "web-windows-auth", "Web-Asp-Net45", "NET-Framework-45-Features", "Web-Static-Content")

function writeToLog([string] $message)
{
    $message + "`n"
    Add-Content $LogFilePath ((Get-Date -format "yyyy-MM-dd-hh-mm-ss") + ": " + $message + "`n")
}

function writeProgress([int] $progress)
{
    ("%progress%=" + $progress+ "`n")
}


function writeWarning([string] $warning)
{
	writeToLog ("%warning%=" + $warning + "`n")
}


function getInstalledProducts()
{
    writeToLog "Getting Installed Products."
    Get-WmiObject Win32_Product | Select-Object -Property IdentifyingNumber, Name |
    ForEach-Object {$installedProducts.Add($_.IdentifyingNumber,$_.Name)}
}

function productCheck([string] $nugetPackageName, [string] $searchKey, [string] $productName, [string] $provider)
{
	$found = $false
    #nuget - only if have Package-Management support
	if (Get-Module -ListAvailable -Name PackageManagement)
	{
		$found = [bool](Get-Package -Name $nugetPackageName -ProviderName Nuget -ErrorAction SilentlyContinue)
	}    
    if ($found -eq $false)
    {
		if ($installedProducts.Count -eq 0) {getInstalledProducts}
		#program search
		$foundValues = $installedProducts.Values | % { if($_ -like $searchKey){$found = $true}}
    }
	$preReqStatus.Add($nugetPackageName,$found)
	writeToLog ($productName + " is " + (&{If(!$found) {"not "}}) + "installed")    
}

function getPrerequisiteStatus()
{
	writeToLog "Checking pre-requisites."
    #Windows Server features    
    if ($OSVersion.Major -eq '6') {
        $features.Add("Application-Server")
    }
    foreach($feature in $features)
    {
        $srv=Get-WindowsFeature $feature
        $preReqStatus.Add($feature,$srv.Installed)
		writeToLog ($srv.DisplayName + " feature is " + (&{If(!$srv.Installed) {"not "}}) + "installed")
    }
    #.NET Framework check
    $installed = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\' -Name Install -ErrorAction SilentlyContinue -ErrorVariable evInstalled).install
	$release = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\' -Name Release -ErrorAction SilentlyContinue -ErrorVariable evRelease).release
	$preReqStatus.Add("NET Framework 4.6.2", ($release -lt 394806) -or ($installed -ne 1))
	writeToLog ("NET Framework 4.6.2 is " + (&{If($preReqStatus["NET Framework 4.6.2"]) {""} Else {"not "}}) + "installed.")
    #WMF 5.1
    $preReqStatus.Add("WMF 5.1", [System.Version]$PSVersionTable.PSVersion -ge [System.Version]"5.1.0.0")    
	if ([System.Version]$PSVersionTable.PSVersion -ge [System.Version]"5.1.0.0")
	{
		writeToLog ("Windows Management Framework " + $PSVersionTable.PSVersion + " is installed.")
	}
	else
	{
		writeToLog ("The required minimum version of Windows Management Framework (5.1) is not installed.")
	}
	Register-PackageSource -Name Nuget -Location https://www.nuget.org/api/v2 -ProviderName Nuget -ErrorAction SilentlyContinue
	productCheck -nugetPackageName "Microsoft.SqlServer.TransactSql.ScriptDom" -searchKey "Microsoft SQL Server*T-SQL ScriptDom*" -provider "nuget" -productName "Microsoft SQL Server Parser and Script Generator"
	productCheck -nugetPackageName "Microsoft.SqlServer.Types" -searchKey "Microsoft System CLR Types for SQL Server*" -provider "nuget" -productName "Microsoft SQL Server spatial types"
	productCheck -nugetPackageName "SqlServer" -searchKey "Windows PowerShell Extensions for SQL Server*" -provider "PowerShellGet" -productName "Windows PowerShell Extensions for SQL Server"
	productCheck -nugetPackageName "Microsoft.Web.Deployment" -searchKey "Microsoft Web Deploy *" -provider "nuget" -productName "Microsoft Web Deployment"
}

function installRequiredWindowsFeatures(){

    foreach($feature in $features)
    {
		$featureStatus = $preReqStatus.Item($features)
		if ($featureStatus -eq $false)
		{
			try
			{
				$pctComplete = $pctComplete + 10;
				writeProgress $pctComplete;
				$srv=Get-WindowsFeature $feature
				if(! $srv.Installed){
					writeToLog ("Enabling server feature: " + $srv.DisplayName)
					install-WindowsFeature $feature
					writeToLog ($srv.DisplayName + " enabled.")
				}				
			}
			catch [Exception]{
				$ex = $_.Exception.Message
				writeWarning ("Failed to install windows feature: " + $ex)
			}
		}
    }
}

function installNugetPackages(){
    try
	{
		writeToLog ("Checking Nuget packages.")
		#check if we are running off-line
		$hasInternetConnectivity = (Test-Connection -computer cireson.com -count 1 -Quiet)
		if ($hasInternetConnectivity -eq $false)
		{
			Register-PackageSource -Location $downloadDir -ProviderName Nuget -Name LocalNuget
		}
		[System.Collections.ArrayList]$nugetPackages = @("Microsoft.SqlServer.TransactSql.ScriptDom", "Microsoft.SqlServer.Types", "Microsoft.SqlServer.SqlManagementObjects", "SqlServer", "Microsoft.Web.Deployment")
        foreach($nugetPackage in $nugetPackages)
        {
			writeToLog ("Checking Nuget package " + $nugetPackage)
			$nugetStatus = $preReqStatus.Item($nugetPackage)
			if ($nugetStatus -eq $false)
			{
				$pctComplete = $pctComplete + 5
			    writeProgress $pctComplete;
                writeToLog ("Nuget package " + $nugetPackage + " is not installed, performing Nuget installation.")
				if ($nugetPackage -eq "SqlServer")
				{
					if ($hasInternetConnectivity -eq $false)
					{
						Install-Package -Name $nugetPackage -ProviderName PowerShellGet -Source LocalNuget -Force
					}
					else
					{
						Install-Package -Name $nugetPackage -ProviderName PowerShellGet -Force
					}
					
				}
				else
				{
					if ($hasInternetConnectivity -eq $false)
					{
						Install-Package -Name $nugetPackage -ProviderName Nuget -Source LocalNuget -Force
					}
					else
					{
						Install-Package -Name $nugetPackage -ProviderName Nuget -Force 
					}
				}
			}
			else
			{
				writeToLog ("Nuget package or Windows Installer package for " + $nugetPackage + " is already installed.")
			}
        }
    }catch [Exception]{
        $ex = $_.Exception.Message
        writeWarning ("Failed to install prereqs: " + $ex)
    }
}

function downloadFiles([String]$url, [String]$destination)
{
	try{
		if(test-path $destination) {
			writeToLog ("File '" + $destination + " already exists, will not attempt download.");
			return 
		}

		writeToLog ("Downloading files from Microsoft: $url")
		(New-Object System.Net.WebClient).DownloadFile($url, $destination)
	}catch [Exception]{
        if ($_.Exception.Message -notcontains 'already exists.')
        {
		    $ex = $_.Exception.Message
            writeWarning ("Failed to download files: " + $ex)
        }
	}
}

function downloadWMF()
{
	#Windows Management Framework 5.1
	if($OSVersion.Contains("6.1"))
	{
		#Windows Server 2008 R2
		downloadFiles "https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win7AndW2K8R2-KB3191566-x64.zip" "$downloadDir\Win7AndW2K8R2-KB3191566-x64.zip"
	} 
	elseif($OSVersion.Contains('6.2'))
	{
		#Windows Server 2012
		downloadFiles "https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/W2K12-KB3191565-x64.msu" "$downloadDir\W2K12-KB3191565-x64.msu"
	} 
	elseif($OSVersion.Contains('6.3'))
	{
		#Windows Server 2012 R2
		downloadFiles "https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win8.1AndW2K12R2-KB3191564-x64.msu" "$downloadDir\Win8.1AndW2K12R2-KB3191564-x64.msu"
	}
	
}

function downloadDotNET()
{
	#download the full off-line installer for .NET Framework 4.6.2
	$frameworkInstaller = "https://download.microsoft.com/download/F/9/4/F942F07D-F26F-4F30-B4E3-EBD54FABA377/NDP462-KB3151800-x86-x64-AllOS-ENU.exe"
	downloadFiles $frameworkInstaller "$downloadDir\NDP462-KB3151800-x86-x64-AllOS-ENU.exe"
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)
	try
	{
		writeToLog("Extracting '$zipfile' to '$outpath'")
		[System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
	}
	catch [System.Exception]{
        if (!$_.Exception.Message.endswith("already exists."))
        {
		    $ex = $_.Exception.Message
            writeWarning ("Failed to extract zip file. " + $ex)
        }
	}
}

function installFrameworks(){
	
	$netfwStatus = $preReqStatus.Item("NET Framework 4.6.2")
	if ($netfwStatus -eq $false)
	{
		downloadDotNET
		writeToLog("Installing .NET Framework 4.6.2")
		Start-Process "$downloadDir\NDP462-KB3151800-x86-x64-AllOS-ENU.exe" -ArgumentList @("/q", "/norestart") -Wait
		writeToLog("Finished installing .NET Framework 4.6.2")
	} 

	if ([System.Version]$PSVersionTable.PSVersion -lt [System.Version]"5.1.0.0")
	{
		#We need to download and install Windows Management Framework 5.1 to use PackageManagement (nuget/myget)
		downloadWMF
		
		$files = Get-ChildItem $downloadDir -Filter *.zip | Sort-Object Name
		foreach($file in $files){
			Unzip -zipfile $file.FullName -outpath $downloadDir
		}

		writeToLog("Running Windows Management Framework 5.1 installation.")
		& "$downloadDir\InstallWMF.ps1" -AcceptEULA
	}
}

function isRebootPending()
{
	writeToLog("Checking if we have a pending reboot.")
	if (Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending" -EA Ignore) { return $true }
	if (Get-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired" -EA Ignore) { return $true }
	if (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name PendingFileRenameOperations -EA Ignore) { return $true }
	try { 
		$util = [wmiclass]"\\.\root\ccm\clientsdk:CCM_ClientUtilities"
		$status = $util.DetermineIfRebootPending()
		if(($status -ne $null) -and $status.RebootPending){
			writeToLog("A pending reboot was detected.")
			return $true
		}
	}catch{} 
	writeToLog("No pending reboot detected.")
	return $false
}

# Main
getPrerequisiteStatus
writeProgress(20)
installRequiredWindowsFeatures
writeProgress(30)
installFrameworks
writeProgress(60)
$rebootPending = (isRebootPending)
if ($rebootPending -eq $false)
{
	if (Get-Module -ListAvailable -Name PackageManagement)
	{
		installNugetPackages
	}
}
$pctComplete = 100