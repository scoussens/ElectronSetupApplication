import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { DropDownsModule } from '@progress/kendo-angular-dropdowns';
import { GridModule } from '@progress/kendo-angular-grid';
import { InputsModule } from '@progress/kendo-angular-inputs';
import { LayoutModule } from '@progress/kendo-angular-layout';
import { NgxElectronModule } from 'ngx-electron';
import { AppComponent } from './app.component';
import { CompleteComponent } from './component/complete/complete.component';
import { ConfigurationComponentsComponent } from './component/configuration/configuration-components/configuration-components.component';
import { ConfigurationDatabasesComponent } from './component/configuration/configuration-databases/configuration-databases.component';
import { ConfigurationPlatformComponent } from './component/configuration/configuration-platform/configuration-platform.component';
import { ConfigurationTabsComponent } from './component/configuration/configuration-tabs/configuration-tabs.component';
import { ConfigurationWebsiteComponent } from './component/configuration/configuration-website/configuration-website.component';
import { ConfigurationComponent } from './component/configuration/configuration.component';
import { ConfirmationComponent } from './component/confirmation/confirmation.component';
import { InstallationComponent } from './component/installation/installation.component';
import { LicenseComponent } from './component/license/license.component';
import { NavBottomComponent } from './component/nav-bottom/nav-bottom.component';
import { NavComponent } from './component/nav/nav.component';
import { WelcomeComponent } from './component/welcome/welcome.component';
import { GroupPickerComponent } from './directives/group-picker/group-picker.component';
import { UserPickerComponent } from './directives/user-picker/user-picker.component';
import { AppRoutingModule } from './modules/routing.module';
import { ConfigurationService } from './services/configuration.service';
import { NavService } from './services/nav.service';
import { PowershellService } from './services/powershell.service';
import { ValidatedPasswordComponent } from './directives/validated-password/validated-password.component';
import { ConfigurationCacheComponent } from './component/configuration/configuration-cache/configuration-cache.component';

@NgModule({
  declarations: [
    AppComponent,
    NavComponent,
    WelcomeComponent,
    LicenseComponent,
    ConfigurationComponent,
    ConfirmationComponent,
    InstallationComponent,
    NavBottomComponent,
    CompleteComponent,
    UserPickerComponent,
    ConfigurationTabsComponent,
    ConfigurationComponentsComponent,
    ConfigurationDatabasesComponent,
    ConfigurationPlatformComponent,
    ConfigurationWebsiteComponent,
    GroupPickerComponent,
    ValidatedPasswordComponent,
    ConfigurationCacheComponent
  ],
  imports: [
    BrowserAnimationsModule,
    BrowserModule,
    FormsModule,
    NgxElectronModule,
    AppRoutingModule,
    GridModule,
    LayoutModule,
    DropDownsModule,
    InputsModule
  ],
  providers: [PowershellService, NavService, ConfigurationService],
  bootstrap: [AppComponent]
})
export class AppModule { }
