import { Injectable } from '@angular/core';

export interface ConfigurationSettings {
  components: {
    installAll: boolean
    installDb: boolean
    installWebsite: boolean
    installServices: boolean
    installMdt: boolean
    installSsrs: boolean
  }
  cm: {
    siteServerName: string
    dbServerName: string
    dbName: string
    dbUseNtAuth: boolean
    dbSqlUsername: string
    dbSqlPassword: string
  }
  cc: {
    licenseKey: string
    dbServerName: string
    dbName: string
    dbUseNtAuth: boolean
    dbSqlUsername: string
    dbSqlPassword: string
    hostServiceLocalSystem: boolean
    hostServiceUsername: string
    hostServicePassword: string
    deploymentServicePort: number
    cacheServicePort: number
  }
  platform: {
    useAppPool: boolean
    platformUsername: string
    platformPassword: string
    rmUsePlatformAccount: boolean
    rmUsername: string
    rmPassword: string
    cmUsePlatformAccount: boolean
    cmUsername: string
    cmPassword: string
    adUsePlatformAccount: boolean
    adUsername: string
    adPassword: string
    adRoot: string
  }
  ssrs: {
    dbServerName: string
    dbName: string
    dbUseNtAuth: boolean
    dbSqlUsername: string
    dbSqlPassword: string
  }
  mdt: {
    dbServerName: string
    dbName: string
    dbUseNtAuth: boolean
    dbSqlUsername: string
    dbSqlPassword: string
  }
  website: {
    appPoolUser: string
    appPoolPassword: string
    adminGroup: string
    installDir: string
    sitename: string
    hostname: string
    sitePort: number
    sslPort: number
    sslCert: string
    registerDns: boolean
  }
}

@Injectable({
  providedIn: 'root'
})
export class ConfigurationService {
  settings: ConfigurationSettings = {
    components: {
      installAll: true,
      installDb: true,
      installWebsite: true,
      installServices: true,
      installMdt: true,
      installSsrs: true
    },
    cm: {
      siteServerName: '',
      dbServerName: '',
      dbName: '',
      dbUseNtAuth: true,
      dbSqlUsername: '',
      dbSqlPassword: ''
    },
    cc: {
      licenseKey: '',
      dbServerName: '',
      dbName: '',
      dbUseNtAuth: true,
      dbSqlUsername: '',
      dbSqlPassword: '',
      hostServiceLocalSystem: false,
      hostServiceUsername: '',
      hostServicePassword: '',
      deploymentServicePort: 8080,
      cacheServicePort: 8081
    },
    platform: {
      useAppPool: false,
      platformUsername: '',
      platformPassword: '',
      rmUsePlatformAccount: false,
      rmUsername: '',
      rmPassword: '',
      cmUsePlatformAccount: false,
      cmUsername: '',
      cmPassword: '',
      adUsePlatformAccount: false,
      adUsername: '',
      adPassword: '',
      adRoot: ''
    },
    ssrs: {
      dbServerName: '',
      dbName: '',
      dbUseNtAuth: true,
      dbSqlUsername: '',
      dbSqlPassword: ''
    },
    mdt: {
      dbServerName: '',
      dbName: '',
      dbUseNtAuth: true,
      dbSqlUsername: '',
      dbSqlPassword: ''
    },
    website: {
      appPoolUser: '',
      appPoolPassword: '',
      adminGroup: '',
      installDir: '',
      sitename: '',
      hostname: '',
      sitePort: 80,
      sslPort: 443,
      sslCert: '',
      registerDns: false
    }
  };

  constructor() { }
}
