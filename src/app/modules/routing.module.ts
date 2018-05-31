import { WebsiteConfigurationComponent } from './../forms/website-configuration/website-configuration.component';
import { DatabaseConfigurationComponent } from './../forms/database-configuration/database-configuration.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ConfigurationComponent } from '../component/configuration/configuration.component';
import { ConfirmationComponent } from '../component/confirmation/confirmation.component';
import { InstallationComponent } from '../component/installation/installation.component';
import { LicenseComponent } from '../component/license/license.component';
import { WelcomeComponent } from '../component/welcome/welcome.component';
import { CompleteComponent } from './../component/complete/complete.component';
import { ComponentsConfigurationComponent } from '../forms/components-configuration/components-configuration.component';
import { PlatformConfigurationComponent } from '../forms/platform-configuration/platform-configuration.component';

const routes: Routes = [
    {
        path: '',
        redirectTo: 'welcome',
        pathMatch: 'full'
    },
    {
        path: 'welcome',
        component: WelcomeComponent
    },
    {
        path: 'license',
        component: LicenseComponent
    },
    {
        path: 'configuration',
        component: ConfigurationComponent,
        children: [
            {
                path: 'components',
                component: ComponentsConfigurationComponent
            },
            {
                path: 'database',
                component: DatabaseConfigurationComponent
            },
            {
                path: 'platform',
                component: PlatformConfigurationComponent
            },
            {
                path: 'website',
                component: WebsiteConfigurationComponent
            },
        ]
    },
    {
        path: 'confirmation',
        component: ConfirmationComponent
    },
    {
        path: 'installation',
        component: InstallationComponent
    },
    {
        path: 'complete',
        component: CompleteComponent
    }
];

@NgModule({
    imports: [RouterModule.forRoot(routes, {useHash: true})],
    exports: [RouterModule]
})
export class AppRoutingModule {}
