try {
    writeToLog("Creating Cireson Platform database logins.")
    Copy-Item -Path "$InstallationFilesDir\DBScripts\SetupLogins.sql" -Destination ("$InstallationFilesDir\DBScripts\SetupLogins-Platform-Temp.sql") -force

    replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Platform-Temp.sql") "%CMPortalDatabaseName%" $CmpDatabaseName
    replaceTokensInFile ("$InstallationFilesDir\DBScripts\SetupLogins-Platform-Temp.sql") "%PortalUser%" $PlatformServiceUser

    writeToLog("Attempting to create Platform Database Logins on " + $CmpSqlServer)

    Invoke-Sqlcmd -InputFile "$InstallationFilesDir\DBScripts\SetupLogins-Platform-Temp.sql" -ServerInstance $CmpSqlServer -ErrorAction 'Stop' -Verbose -QueryTimeout 60 
}
catch [Exception] {
    $ex = $_.Exception.Message
    writeError("Failed to create Platform Database logins on DB '" + $CmpDatabaseName + "' on server '$CmpSqlServer': " + $ex)
}