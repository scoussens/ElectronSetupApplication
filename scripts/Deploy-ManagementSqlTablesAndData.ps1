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