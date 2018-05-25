import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { WelcomeComponent } from '../component/welcome/welcome.component';
import { LicenseComponent } from '../component/license/license.component';
import { ConfigurationComponent } from '../component/configuration/configuration.component';
import { ConfirmationComponent } from '../component/confirmation/confirmation.component';
import { InstallationComponent } from '../component/installation/installation.component';

const routes: Routes = [
    {
        path: '',
        component: WelcomeComponent
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
        component: ConfigurationComponent
    },
    {
        path: 'confirmation',
        component: ConfirmationComponent
    },
    {
        path: 'installation',
        component: InstallationComponent
    }
];

@NgModule({
    imports: [RouterModule.forRoot(routes, {useHash: true})],
    exports: [RouterModule]
})
export class AppRoutingModule { }
