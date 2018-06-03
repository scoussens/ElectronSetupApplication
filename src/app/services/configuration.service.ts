import { Injectable } from '@angular/core';
import { ConfigurationSettings, Group, SettingGroup, User } from './configuration.models';
import { PsCommandType, PsParameter } from './powershell.models';
import { PowershellService } from './powershell.service';

@Injectable({
  providedIn: 'root'
})
export class ConfigurationService {
  settings: ConfigurationSettings = {
    version: '0.0.1',
    components: {
      installAll: {
        displayName: 'Install All Components',
        paramaterName: null,
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
      siteServerName: {
        displayName: 'Site Server Name',
        paramaterName: 'ConfigMgrSiteServer',
        value: ''
      },
      dbServerName: {
        displayName: 'Database Server',
        paramaterName: 'ConfigMgrSqlServer',
        value: ''
      },
      dbName: {
        displayName: 'Database Name',
        paramaterName: 'ConfigMgrDatabaseName',
        value: ''
      },
      dbUseNtAuth: {
        displayName: 'Use Windows Auth',
        paramaterName: 'ConfigMgrDbUseWinAuth',
        value: true
      },
      dbSqlUsername: {
        displayName: 'SQL Username',
        paramaterName: 'ConfigMgrSqlLogin',
        value: null
      },
      dbSqlPassword: {
        displayName: 'SQL Password',
        paramaterName: 'ConfigMgrSqlPasswordHash',
        value: null
      }
    },
    cc: {
      licenseKey: {
        displayName: 'License Key',
        paramaterName: 'LicenseKey',
        value: ''
      },
      dbServerName: {
        displayName: 'Database Server',
        paramaterName: 'CmpSqlServer',
        value: null
      },
      dbName: {
        displayName: 'Database Name',
        paramaterName: 'CmpDatabaseName',
        value: null
      },
      dbUseNtAuth: {
        displayName: 'Use Win Auth',
        paramaterName: 'CmpDbUseWinAuth',
        value: true
      },
      dbSqlUsername: {
        displayName: 'SQL Username',
        paramaterName: 'CmpSqlLogin',
        value: null
      },
      dbSqlPassword: {
        displayName: 'SQL Password',
        paramaterName: 'CmpSqlPasswordHash',
        value: null
      },
      hostServiceLocalSystem: {
        displayName: 'Use Win Auth',
        paramaterName: 'UseLocalSystemAsServiceAccount',
        value: true
      },
      hostServiceUsername: {
        displayName: 'Host Service Username',
        paramaterName: 'ServiceUser',
        value: null
      },
      hostServicePassword: {
        displayName: 'Host Service Password',
        paramaterName: 'ServicePassword',
        value: null
      },
      deploymentServicePort: {
        displayName: 'Deployment Service Port',
        paramaterName: 'DeploymentServicePort',
        value: 8080
      },
      cacheServicePort: {
        displayName: 'Cache Service Port',
        paramaterName: 'CacheServicePort',
        value: 8081
      }
    },
    platform: {
      useAppPool: {
        displayName: 'Use App Pool Account',
        paramaterName: 'UseAppPoolAsPlatformServiceAccount',
        value: true
      },
      platformUsername: {
        displayName: 'Platform Username',
        paramaterName: 'PlatformServiceUser',
        value: null
      },
      platformPassword: {
        displayName: 'Platform Password',
        paramaterName: 'PlatformServicePassword',
        value: null
      },
      rmUsePlatformAccount: {
        displayName: 'Use Platform Account',
        paramaterName: 'UseWinAuthForRemoteManage',
        value: true
      },
      rmUsername: {
        displayName: 'WinRM Username',
        paramaterName: 'RemoteManageServiceUser',
        value: null
      },
      rmPassword: {
        displayName: 'WinRM Password',
        paramaterName: 'RemoteManageServicePassword',
        value: null
      },
      cmUsePlatformAccount: {
        displayName: 'Use Platform Account',
        paramaterName: 'UsePlatformServiceAccountForConfigMgr',
        value: true
      },
      cmUsername: {
        displayName: 'ConfigMgr Username',
        paramaterName: 'PlatformConfigMgrServiceUser',
        value: null
      },
      cmPassword: {
        displayName: 'ConfigMgr Password',
        paramaterName: 'PlatformConfigMgrServicePassword',
        value: null
      },
      adUsePlatformAccount: {
        displayName: 'Use Platform Account',
        paramaterName: 'UsePlatformServiceAccountForAdSync',
        value: true
      },
      adUsername: {
        displayName: 'AD Username',
        paramaterName: 'AdSyncUser',
        value: null
      },
      adPassword: {
        displayName: 'AD Password',
        paramaterName: 'AdSyncPassword',
        value: null
      },
      adRoot: {
        displayName: 'AD Search Root',
        paramaterName: 'Ldap',
        value: 'LDAP://DC=cireson,DC=com'
      }
    },
    ssrs: {
      dbServerName: {
        displayName: 'Database Server',
        paramaterName: 'SsrsServerName',
        value: ''
      },
      dbName: {
        displayName: 'Database Name',
        paramaterName: 'SsrsDatabaseName',
        value: ''
      },
      dbUseNtAuth: {
        displayName: 'Use Win Auth',
        paramaterName: 'SsrsDbUseWinAuth',
        value: true
      },
      dbSqlUsername: {
        displayName: '',
        paramaterName: 'SsrsSqlLogin',
        value: null
      },
      dbSqlPassword: {
        displayName: '',
        paramaterName: 'SsrsSqlPasswordHash',
        value: null
      }
    },
    mdt: {
      dbServerName: {
        displayName: 'Database Server',
        paramaterName: 'MdtSqlServer',
        value: ''
      },
      dbName: {
        displayName: 'Database Name',
        paramaterName: 'MdtDatabaseName',
        value: ''
      },
      dbUseNtAuth: {
        displayName: 'Use Win Auth',
        paramaterName: 'MdtDbUseWinAuth',
        value: true
      },
      dbSqlUsername: {
        displayName: 'SQL Username',
        paramaterName: 'MdtSqlLogin',
        value: ''
      },
      dbSqlPassword: {
        displayName: 'SQL Password',
        paramaterName: 'MdtSqlPasswordHash',
        value: ''
      }
    },
    website: {
      appPoolUser: {
        displayName: 'Application Pool Account',
        paramaterName: 'AppPoolUser',
        value: null
      },
      appPoolPassword: {
        displayName: 'App Pool Password',
        paramaterName: 'AppPoolPassword',
        value: null
      },
      adminGroup: {
        displayName: 'Control Center Admin Group',
        paramaterName: 'CmpAdminGroup',
        value: null
      },
      installDir: {
        displayName: 'Install Directory',
        paramaterName: 'SiteRootPath',
        value: 'C:\\InetPub\\'
      },
      siteName: {
        displayName: 'Site Name',
        paramaterName: 'SiteName',
        value: 'ControlCenter'
      },
      hostName: {
        displayName: 'Hostname',
        paramaterName: 'Hostname',
        value: null
      },
      sitePort: {
        displayName: 'HTTP Port',
        paramaterName: 'SitePort',
        value: 80
      },
      sslPort: {
        displayName: 'SSL Port',
        paramaterName: 'HttpsListenerPort',
        value: 443
      },
      sslCert: {
        displayName: '',
        paramaterName: 'SSLCertificateName',
        value: null
      },
      registerDns: {
        displayName: 'Register Hostname with DNS',
        paramaterName: 'AddHostNameToDns',
        value: false
      }
    }
  };

  constructor(private ps: PowershellService) {
    this.loadConfig();
  }

  loadConfig() {
    let config: ConfigurationSettings = JSON.parse(localStorage.getItem('settings'));
    if (config && config.version === this.settings.version) {
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
    // for future use to configure default parameters
    let defaultParams: PsParameter[] = [
      // { ApplicationTitle: "Control Center" },
      // { LanguageCode: "ENU" },
      // { LanguageCodeDateTime: "ENU" },
      // { LogFilePath: null },
      // { CacheLanguageCodes: "*" },
      // { AcceptEula: true },
      // { IsUpgradeScenario: false },
      // { IsSql2014OrGreater: false },
      // { CustomerKey: "" },
      // { PlatformServicePort: null },
      // { PlatformServiceUrl: '*' },
      // { PlatformCPEXAppVersion: null },
    ];

    let params: PsParameter[] = [];
    Object.keys(this.settings).forEach(key => {
      let settingGroup = this.settings[key];
      let settingParams = this.buildParamaterArrayFromObject(settingGroup);
      params = params.concat(settingParams)
    });
    
    let allParams = params.concat(defaultParams)
    return this.ps.stream<string>(PsCommandType.Script, 'Install-Portal.ps1', allParams);
  }

  // builds a paramater array, removing any properties that are null or empty
  private buildParamaterArrayFromObject(obj: SettingGroup) {
    let paramArray: PsParameter[] = [];

    Object.keys(obj).forEach(key => {
      let setting = obj[key];
      if (!setting.paramaterName || !setting.value || String(setting.value).trim().length === 0) {
        return;
      }

      let param = {};
      param[setting.paramaterName] = setting.value;

      paramArray.push(param)
    })

    return paramArray;
  }
}
