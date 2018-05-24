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