import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgxElectronModule } from 'ngx-electron';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './modules/routing.module';
import { PowershellService } from './services/powershell.service';
import { GridModule } from '@progress/kendo-angular-grid';
import { LayoutModule } from '@progress/kendo-angular-layout';
import { NavComponent } from './component/nav/nav.component';
import { WelcomeComponent } from './component/welcome/welcome.component';
import { LicenseComponent } from './component/license/license.component';
import { ConfigurationComponent } from './component/configuration/configuration.component';
import { ConfirmationComponent } from './component/confirmation/confirmation.component';
import { InstallationComponent } from './component/installation/installation.component';
import { NavBottomComponent } from './component/nav-bottom/nav-bottom.component';

@NgModule({
  declarations: [
    AppComponent,
    NavComponent,
    WelcomeComponent,
    LicenseComponent,
    ConfigurationComponent,
    ConfirmationComponent,
    InstallationComponent,
    NavBottomComponent
  ],
  imports: [
    BrowserAnimationsModule,
    BrowserModule,
    NgxElectronModule,
    AppRoutingModule,
    GridModule,
    LayoutModule
  ],
  providers: [PowershellService],
  bootstrap: [AppComponent]
})
export class AppModule { }
