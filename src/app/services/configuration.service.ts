import { Injectable } from '@angular/core';

export enum ConfigurationAuthTypes {
  WindowsAuth,
  SqlAuth
}

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
    dbAuthType: ConfigurationAuthTypes
    dbSqlUsername: string
    dbSqlPassword: string
  }
  cc: {
    licenseKey: string
    dbServerName: string
    dbName: string
    dbAuthType: ConfigurationAuthTypes
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
    dbAuthType: ConfigurationAuthTypes
    dbSqlUsername: string
    dbSqlPassword: string
  }
  mdt: {
    dbServerName: string
    dbName: string
    dbAuthType: ConfigurationAuthTypes
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
      dbName: 'string',
      dbAuthType: ConfigurationAuthTypes.WindowsAuth,
      dbSqlUsername: 'string',
      dbSqlPassword: 'string'
    },
    cc: {
      licenseKey: 'string',
      dbServerName: 'string',
      dbName: '',
      dbAuthType: ConfigurationAuthTypes.WindowsAuth,
      dbSqlUsername: 'string',
      dbSqlPassword: 'string',
      hostServiceLocalSystem: false,
      hostServiceUsername: 'string',
      hostServicePassword: 'string',
      deploymentServicePort: 8080,
      cacheServicePort: 8081
    },
    platform: {
      useAppPool: false,
      platformUsername: 'string',
      platformPassword: 'string',
      rmUsePlatformAccount: false,
      rmUsername: 'string',
      rmPassword: 'string',
      cmUsePlatformAccount: false,
      cmUsername: 'string',
      cmPassword: 'string',
      adUsePlatformAccount: false,
      adUsername: 'string',
      adPassword: 'string',
      adRoot: 'string'
    },
    ssrs: {
      dbServerName: 'string',
      dbName: 'string',
      dbAuthType: ConfigurationAuthTypes.WindowsAuth,
      dbSqlUsername: 'string',
      dbSqlPassword: 'string'
    },
    mdt: {
      dbServerName: 'string',
      dbName: 'string',
      dbAuthType: ConfigurationAuthTypes.WindowsAuth,
      dbSqlUsername: 'string',
      dbSqlPassword: 'string'
    },
    website: {
      appPoolUser: 'string',
      appPoolPassword: 'string',
      adminGroup: 'string',
      installDir: 'string',
      sitename: 'string',
      hostname: 'string',
      sitePort: 80,
      sslPort: 443,
      sslCert: 'string',
      registerDns: false
    }
  };

  constructor() { }
}
