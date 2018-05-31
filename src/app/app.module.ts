import { ConfigurationService } from './services/configuration.service';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { GridModule } from '@progress/kendo-angular-grid';
import { LayoutModule } from '@progress/kendo-angular-layout';
import { NgxElectronModule } from 'ngx-electron';
import { AppComponent } from './app.component';
import { CompleteComponent } from './component/complete/complete.component';
import { ConfigurationComponent } from './component/configuration/configuration.component';
import { ConfirmationComponent } from './component/confirmation/confirmation.component';
import { InstallationComponent } from './component/installation/installation.component';
import { LicenseComponent } from './component/license/license.component';
import { NavBottomComponent } from './component/nav-bottom/nav-bottom.component';
import { NavComponent } from './component/nav/nav.component';
import { WelcomeComponent } from './component/welcome/welcome.component';
import { ComponentsConfigurationComponent } from './forms/components-configuration/components-configuration.component';
import { DatabaseConfigurationComponent } from './forms/database-configuration/database-configuration.component';
import { PlatformConfigurationComponent } from './forms/platform-configuration/platform-configuration.component';
import { WebsiteConfigurationComponent } from './forms/website-configuration/website-configuration.component';
import { AppRoutingModule } from './modules/routing.module';
import { NavService } from './services/nav.service';
import { PowershellService } from './services/powershell.service';
import { DropDownsModule } from '@progress/kendo-angular-dropdowns';
import { InputsModule } from '@progress/kendo-angular-inputs';
import { UserpickerComponent } from './directives/userpicker/userpicker.component';

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
    ComponentsConfigurationComponent,
    DatabaseConfigurationComponent,
    WebsiteConfigurationComponent,
    PlatformConfigurationComponent,
    UserpickerComponent
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
