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