export interface User {
    cn: string,
    displayName: string,
    samAccountName: string
}

export interface Group {
    cn: string,
    displayName: string,
    samAccountName: string
}

export interface SettingGroup {
    [key: string]: SettingItem
}

export interface SettingItem {
    displayName: string
    paramaterName: string
    value: string | number | boolean | Date | null
}

export interface ConfigurationSettings {
    components: SettingGroup
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
        siteName: string
        hostName: string
        sitePort: number
        sslPort: number
        sslCert: string
        registerDns: boolean
    }
}