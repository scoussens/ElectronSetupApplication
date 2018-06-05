import { ConfigMgrSettings, WebsiteSettings } from './configuration.models';
export interface User {
    cn: string
    displayName: string
    samAccountName: string
    domain: string
    loginValue: string
}

export interface Group {
    cn: string
    displayName: string
    samAccountName: string
    domain: string
    loginValue: string
}

export interface SettingGroup {
    [key: string]: any
}

export interface SettingItem {
    displayName: string
    paramaterName: string
    value: string | number | boolean | Date | null
}

export interface ConfigurationSettings {
    version: string
    components: ComponentSettings
    cm: ConfigMgrSettings
    cc: ControlCenterSettings
    platform: PlatformSettings
    ssrs: SsrsSettings
    mdt: MdtSettings
    website: WebsiteSettings
}

export interface ComponentSettings extends SettingGroup {
    installAll: SettingItem
    installDb: SettingItem
    installWebsite: SettingItem
    installServices: SettingItem
    installMdt: SettingItem
    installSsrs: SettingItem
}

export interface ConfigMgrSettings extends SettingGroup {
    siteServerName: SettingItem
    dbServerName: SettingItem
    dbName: SettingItem
    dbUseNtAuth: SettingItem
    dbSqlUsername: SettingItem
    dbSqlPassword: SettingItem
}

export interface ControlCenterSettings extends SettingGroup {
    licenseKey: SettingItem
    dbServerName: SettingItem
    dbName: SettingItem
    dbUseNtAuth: SettingItem
    dbSqlUsername: SettingItem
    dbSqlPassword: SettingItem
    hostServiceLocalSystem: SettingItem
    hostServiceUsername: SettingItem
    hostServicePassword: SettingItem
    deploymentServicePort: SettingItem
    cacheServicePort: SettingItem
}

export interface PlatformSettings extends SettingGroup {
    useAppPool: SettingItem
    platformUsername: SettingItem
    platformPassword: SettingItem
    rmUsePlatformAccount: SettingItem
    rmUsername: SettingItem
    rmPassword: SettingItem
    cmUsePlatformAccount: SettingItem
    cmUsername: SettingItem
    cmPassword: SettingItem
    adUsePlatformAccount: SettingItem
    adUsername: SettingItem
    adPassword: SettingItem
    adRoot: SettingItem
}

export interface SsrsSettings extends SettingGroup {
    dbServerName: SettingItem
    dbName: SettingItem
    dbUseNtAuth: SettingItem
    dbSqlUsername: SettingItem
    dbSqlPassword: SettingItem
}

export interface MdtSettings extends SettingGroup {
    dbServerName: SettingItem
    dbName: SettingItem
    dbUseNtAuth: SettingItem
    dbSqlUsername: SettingItem
    dbSqlPassword: SettingItem
}

export interface WebsiteSettings extends SettingGroup {
    appPoolUser: SettingItem
    appPoolPassword: SettingItem
    adminGroup: SettingItem
    installDir: SettingItem
    siteName: SettingItem
    hostName: SettingItem
    sitePort: SettingItem
    sslPort: SettingItem
    sslCert: SettingItem
    registerDns: SettingItem
}