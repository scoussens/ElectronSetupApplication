try {
        
    $configMgrService = get-wmiobject -query 'select * from win32_service where name="Cireson ConfigMgr Portal Hosting Service"'
    #$configMgrService = Get-Service -Name "Cireson ConfigMgr Portal Hosting Service" -ErrorAction Continue
    if ($configMgrService -ne $null) {
        writeToLog "Obtaining existing WIndows Service"
        $cmpService = Get-WmiObject -Class Win32_Product -Filter "Name = 'Cireson ConfigMgr Portal Service'" #Takes a few seconds...
        foreach ($thisApp in $cmpService) {
            writeToLog "Uninstalling $($thisApp.Name) v$($thisApp.Version)."
            Start-Process "msiexec.exe" -arg ("/X" + $thisApp.IdentifyingNumber + " /qb") -Wait
        }
    }
    
}
catch [Exception] {
    $ex = $_.Exception.Message
    writeError("Failed to uninstall windows service: " + $ex)
}