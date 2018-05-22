import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { NgxElectronModule } from 'ngx-electron';
import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { AppRoutingModule } from './modules/routing.module';
import { PowershellService } from './services/powershell.service';



@NgModule({
  declarations: [
    AppComponent,
    HomeComponent
  ],
  imports: [
    BrowserModule,
    NgxElectronModule,
    AppRoutingModule
  ],
  providers: [PowershellService],
  bootstrap: [AppComponent]
})
export class AppModule { }
