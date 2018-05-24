try {
        
    $configMgrService = get-wmiobject -query 'select * from win32_service where name="Cireson ConfigMgr Portal Hosting Service"'
    #$configMgrService = Get-Service -Name "Cireson ConfigMgr Portal Hosting Service" -ErrorAction Continue
    if ($configMgrService -eq $null) {
        writeToLog ("Installing Cireson ConfigMgr Portal Hosting Service")
        $msiInstallerFullName = $InstallationFilesDir + "\ServiceInstallers\Cireson ConfigMgr Portal Service x64.msi"
        if ((Get-WmiObject Win32_OperatingSystem).OSArchitecture -eq "32-bit") {
            #OS is x86
            $msiInstallerFullName = $InstallationFilesDir + "\ServiceInstallers\Cireson ConfigMgr Portal Service x86.msi"
        }
        
        Start-Process "msiexec.exe" -arg "/i `"$msiInstallerFullName`" /qn CMPFOLDER=$SiteRootPath$SiteName DEPLOYMENT_PORT=$DeploymentServicePort CACHING_PORT=$CacheServicePort" -Wait
    }
    else {
        writeToLog ("Ignoring existing Windows service.")
    }
    
}
catch [Exception] {
    $ex = $_.Exception.Message
    writeError("Failed to install windows service: " + $ex)
}