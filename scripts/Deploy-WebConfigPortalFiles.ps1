#Update the Portal's config file.
writeToLog("Updating default site configuration files.")
$configXmlFullName = $SiteRootPath + $SiteName + "\Configuration.xml"
Copy-Item -Path "$InstallationFilesDir\Config\Configuration.xml" -Destination ("$configXmlFullName") -force

replaceTokensInFile ($configXmlFullName) "%CMSiteServer%" $ConfigMgrSiteServer
replaceTokensInFile ($configXmlFullName) "%CMSiteSQLServer%" $ConfigMgrSqlServer
replaceTokensInFile ($configXmlFullName) "%CMSiteDatabaseName%" $ConfigMgrDatabaseName
replaceTokensInFile ($configXmlFullName) "%CMPortalSQLServer%" $CmpSqlServer
replaceTokensInFile ($configXmlFullName) "%CMPortalDatabaseName%" $CmpDatabaseName
replaceTokensInFile ($configXmlFullName) "%CMPortalLicenseKey%" $LicenseKey
replaceTokensInFile ($configXmlFullName) "%SysAdminGroup%" $CmpAdminGroup
replaceTokensInFile ($configXmlFullName) "%CustomerKey%" $CustomerKey

#SSRS Settings
if ($EnableSsrsIntegration) {
    replaceTokensInFile ($configXmlFullName) "%SSRSServer%" $SsrsServerName
    replaceTokensInFile ($configXmlFullName) "%SSRSDBName%" $SsrsDatabaseName
}
else {
    replaceTokensInFile ($configXmlFullName) "%SSRSServer%" ""
    replaceTokensInFile ($configXmlFullName) "%SSRSDBName%" ""
}

if ($SsrsDbUseWinAuth) {
    replaceTokensInFile ($configXmlFullName) "%SSRSAuth%" "Windows"
    replaceTokensInFile ($configXmlFullName) "%SSRSLogin%" ""
    replaceTokensInFile ($configXmlFullName) "%SSRSPassword%" ""
}
else {
    replaceTokensInFile ($configXmlFullName) "%SSRSAuth%" "SQL"
    replaceTokensInFile ($configXmlFullName) "%SSRSLogin%" $SsrsSqlLogin
    replaceTokensInFile ($configXmlFullName) "%SSRSPassword%" $SsrsSqlPasswordHash
}


if ($CmpDbUseWinAuth) {
    replaceTokensInFile ($configXmlFullName) "%CMPAuthMode%" "Windows"
    replaceTokensInFile ($configXmlFullName) "%CMPDBUser%" ""
    replaceTokensInFile ($configXmlFullName) "%CMPDBPassword%" ""
}
else {
    replaceTokensInFile ($configXmlFullName) "%CMPAuthMode%" "SQL"
    replaceTokensInFile ($configXmlFullName) "%CMPDBUser%" $CmpSqlLogin
    replaceTokensInFile ($configXmlFullName) "%CMPDBPassword%" $CmpSqlPasswordHash
}

if ($ConfigMgrDbUseWinAuth) {
    replaceTokensInFile ($configXmlFullName) "%ConfigMgrAuthMode%" "Windows"
    replaceTokensInFile ($configXmlFullName) "%ConfigMgrDbUser%" ""
    replaceTokensInFile ($configXmlFullName) "%ConfigMgrDbPassword%" ""
}
else {
    replaceTokensInFile ($configXmlFullName) "%ConfigMgrAuthMode%" "SQL"
    replaceTokensInFile ($configXmlFullName) "%ConfigMgrDbUser%" $ConfigMgrSqlLogin
    replaceTokensInFile ($configXmlFullName) "%ConfigMgrDbPassword%" $ConfigMgrSqlPasswordHash
}

#Set MDT integration
replaceTokensInFile ($configXmlFullName) "%EnableMdtIntegration%" $EnableMdtIntegration

#Set MDT info if the integration is enabled.
if ($EnableMdtIntegration) {
if ($MdtDbUseWinAuth) {
    replaceTokensInFile ($configXmlFullName) "%MDTAuthMode%" "Windows"
    replaceTokensInFile ($configXmlFullName) "%MdtDbUser%" ""
    replaceTokensInFile ($configXmlFullName) "%MdtDbPassword%" ""
}
else {
    replaceTokensInFile ($configXmlFullName) "%MDTAuthMode%" "SQL"
    replaceTokensInFile ($configXmlFullName) "%MdtDbUser%" $MdtSqlLogin
    replaceTokensInFile ($configXmlFullName) "%MdtDbPassword%" $MdtSqlPasswordHash
}

#Setup MDT server information
replaceTokensInFile ($configXmlFullName) "%MdtSqlServer%" $MdtSqlServer
replaceTokensInFile ($configXmlFullName) "%MdtSqlDatabase%" $MdtDatabaseName
}
else {
replaceTokensInFile ($configXmlFullName) "%MDTAuthMode%" "Windows"
replaceTokensInFile ($configXmlFullName) "%MdtDbUser%" ""
replaceTokensInFile ($configXmlFullName) "%MdtDbPassword%" ""
replaceTokensInFile ($configXmlFullName) "%MdtSqlServer%" ""
replaceTokensInFile ($configXmlFullName) "%MdtSqlDatabase%" ""
}

writeToLog("Reading content of 'configuration.xml' in $SiteRootPath$SiteName")
$content = Get-Content $configXmlFullName
writeToLog($content)