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