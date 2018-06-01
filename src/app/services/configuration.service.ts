import { Injectable } from '@angular/core';
import { ConfigurationSettings, Group, SettingGroup, User } from './configuration.models';
import { PsCommandType, PsParameter } from './powershell.models';
import { PowershellService } from './powershell.service';

@Injectable({
  providedIn: 'root'
})
export class ConfigurationService {
  settings: ConfigurationSettings = {
    components: {
      installAll: {
        displayName: 'Install All Components',
        paramaterName: 'installAll',
        value: true
      },
      installDb: {
        displayName: 'Install Database',
        paramaterName: 'InstallDatabase',
        value: true
      },
      installWebsite: {
        displayName: 'Install Website',
        paramaterName: 'InstallWebsite',
        value: true
      },
      installServices: {
        displayName: 'Install Services',
        paramaterName: 'InstallServices',
        value: true
      },
      installMdt: {
        displayName: 'Enable MDT Integration',
        paramaterName: 'EnableMdtIntegration',
        value: true
      },
      installSsrs: {
        displayName: 'Enable SSRS Integration',
        paramaterName: 'EnableSsrsIntegration',
        value: true
      }
    },
    cm: {
      siteServerName: null,
      dbServerName: null,
      dbName: null,
      dbUseNtAuth: true,
      dbSqlUsername: null,
      dbSqlPassword: null
    },
    cc: {
      licenseKey: null,
      dbServerName: null,
      dbName: 'ControlCenter',
      dbUseNtAuth: true,
      dbSqlUsername: null,
      dbSqlPassword: null,
      hostServiceLocalSystem: false,
      hostServiceUsername: null,
      hostServicePassword: null,
      deploymentServicePort: 8080,
      cacheServicePort: 8081
    },
    platform: {
      useAppPool: false,
      platformUsername: null,
      platformPassword: null,
      rmUsePlatformAccount: false,
      rmUsername: null,
      rmPassword: null,
      cmUsePlatformAccount: false,
      cmUsername: null,
      cmPassword: null,
      adUsePlatformAccount: false,
      adUsername: null,
      adPassword: null,
      adRoot: null
    },
    ssrs: {
      dbServerName: null,
      dbName: null,
      dbUseNtAuth: true,
      dbSqlUsername: null,
      dbSqlPassword: null
    },
    mdt: {
      dbServerName: null,
      dbName: null,
      dbUseNtAuth: true,
      dbSqlUsername: null,
      dbSqlPassword: null
    },
    website: {
      appPoolUser: null,
      appPoolPassword: null,
      adminGroup: null,
      installDir: "C:\\InetPub\\",
      siteName: 'ControlCenter',
      hostName: null,
      sitePort: 80,
      sslPort: 443,
      sslCert: null,
      registerDns: false
    }
  };

  constructor(private ps: PowershellService) {
    this.loadConfig();
  }

  loadConfig() {
    let config = JSON.parse(localStorage.getItem('settings'));
    if (config) {
      this.settings = config;
    }
  }

  saveConfig() {
    localStorage.setItem('settings', JSON.stringify(this.settings));
  }

  findAdUsers(samaccountname: string) {
    return this.ps.invoke<User[]>(PsCommandType.Script, 'Get-ADUserOrGroup.ps1', [{ samAccountName: samaccountname }, { objectClass: 'user' }]);
  }

  findAdGroups(samaccountname: string) {
    return this.ps.invoke<Group[]>(PsCommandType.Script, 'Get-ADUserOrGroup.ps1', [{ samAccountName: samaccountname }, { objectClass: 'group' }]);
  }

  validateAdCredentials(username: string, password: string) {
    return this.ps.invoke<boolean>(PsCommandType.Script, 'Test-AdCredential.ps1', [{ username: username }, { password: password }]);
  }

  installPrereqs() {

  }

  installPortal() {
    return this.ps.stream<string>(PsCommandType.Script, 'Install-Portal.ps1', [
      { ConfigMgrSiteServer: this.settings.cm.siteServerName },
      { ConfigMgrSqlServer: this.settings.cm.dbServerName },
      { ConfigMgrDatabaseName: this.settings.cm.dbName },
      { SiteRootPath: this.settings.website.installDir },
      { SiteName: this.settings.website.siteName },
      { SitePort: this.settings.website.sitePort },
      { AppPoolUser: this.settings.website.appPoolUser },
      { AppPoolPassword: this.settings.website.appPoolPassword },
      { ServiceUser: this.settings.cc.hostServiceUsername },
      { ServicePassword: this.settings.cc.hostServicePassword },
      { ApplicationTitle: "Control Center" },
      // { LanguageCode: "ENU" },
      // { LanguageCodeDateTime: "ENU" },
      { CmpSqlServer: this.settings.cc.dbServerName },
      { CmpDatabaseName: this.settings.cc.dbName },
      { InstallWebsite: this.settings.components.installWebsite },
      { InstallDatabase: this.settings.components.installDb },
      { InstallServices: this.settings.components.installServices },
      // { LogFilePath: null },
      // { CacheLanguageCodes: "*" },
      { AcceptEula: true },
      { SSLCertificateName: this.settings.website.sslCert },
      { LicenseKey: this.settings.cc.licenseKey },
      { CmpAdminGroup: this.settings.website.adminGroup },
      { EnableMdtIntegration: this.settings.components.installMdt },
      { ConfigMgrSqlLogin: this.settings.cm.dbSqlUsername },
      { ConfigMgrSqlPasswordHash: this.settings.cm.dbSqlPassword },
      { ConfigMgrDbUseWinAuth: this.settings.cm.dbUseNtAuth },
      { CmpDbUseWinAuth: this.settings.cc.dbUseNtAuth },
      { MdtDbUseWinAuth: this.settings.mdt.dbUseNtAuth },
      { CmpSqlLogin: this.settings.cc.dbSqlUsername },
      { CmpSqlPasswordHash: this.settings.cc.dbSqlPassword },
      { MdtSqlLogin: this.settings.mdt.dbSqlUsername },
      { MdtSqlPasswordHash: this.settings.mdt.dbSqlPassword },
      { MdtSqlServer: this.settings.mdt.dbServerName },
      { MdtDatabaseName: this.settings.mdt.dbName },
      // { CustomerKey: "" },
      { DeploymentServicePort: this.settings.cc.deploymentServicePort },
      { CacheServicePort: this.settings.cc.cacheServicePort },
      { UseLocalSystemAsServiceAccount: this.settings.cc.hostServiceLocalSystem },
      { IsSql2014OrGreater: false },
      { Hostname: this.settings.website.hostName },
      { SsrsServerName: this.settings.ssrs.dbServerName },
      { SsrsDbUseWinAuth: this.settings.ssrs.dbUseNtAuth },
      { SsrsSqlLogin: this.settings.ssrs.dbSqlUsername },
      { SsrsDatabaseName: this.settings.ssrs.dbName },
      { SsrsSqlPasswordHash: this.settings.ssrs.dbSqlPassword },
      { IsUpgradeScenario: false },
      { EnableSsrsIntegration: this.settings.components.installSsrs },
      { PlatformServiceUser: this.settings.platform.platformUsername },
      { PlatformServicePassword: this.settings.platform.platformPassword },
      // { PlatformServicePort: null },
      // { PlatformServiceUrl: '*' },
      // { PlatformCPEXAppVersion: null },
      { PlatformLogLevel: "500" },
      { UseAppPoolAsPlatformServiceAccount: this.settings.platform.useAppPool },
      { PlatformConfigMgrServiceUser: this.settings.platform.cmUsername },
      { PlatformConfigMgrServicePassword: this.settings.platform.cmPassword },
      { UseWinAuthForRemoteManage: this.settings.platform.rmUsePlatformAccount },
      { RemoteManageServiceUser: this.settings.platform.rmUsername },
      { RemoteManageServicePassword: this.settings.platform.rmPassword },
      { UsePlatformServiceAccountForConfigMgr: this.settings.platform.cmUsePlatformAccount },
      { UsePlatformServiceAccountForAdSync: this.settings.platform.adUsePlatformAccount },
      { AdSyncUser: this.settings.platform.adUsername },
      { AdSyncPassword: this.settings.platform.adPassword },
      { Ldap: this.settings.platform.adRoot },
      { AddHostNameToDns: this.settings.website.registerDns },
      { HttpsListenerPort: this.settings.website.sslPort }
    ]);
  }

  private buildParamaterArray(obj: SettingGroup) {
    let paramArray: PsParameter[] = [];
    Object.keys(obj).forEach(key => {
      if(obj[key].value !== null) {
        paramArray.push({})
      }
    })
  }
}
