import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgxElectronModule } from 'ngx-electron';
import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { AppRoutingModule } from './modules/routing.module';
import { PowershellService } from './services/powershell.service';
import { GridModule } from '@progress/kendo-angular-grid';
import { LayoutModule } from '@progress/kendo-angular-layout';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent
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
