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