import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from './../../../services/configuration.service';

@Component({
  selector: 'app-configuration-databases',
  templateUrl: './configuration-databases.component.html',
  styleUrls: ['./configuration-databases.component.scss']
})
export class ConfigurationDatabasesComponent implements OnInit {
  cm: { 
    siteServerName: string; 
    dbServerName: string; 
    dbName: string; 
    dbUseNtAuth: boolean; 
    dbSqlUsername: string; 
    dbSqlPassword: string; 
  };
  cc: { 
    licenseKey: string; 
    dbServerName: string; 
    dbName: string; 
    dbUseNtAuth: boolean; 
    dbSqlUsername: string; 
    dbSqlPassword: string; 
    hostServiceLocalSystem: boolean; 
    hostServiceUsername: string; 
    hostServicePassword: string; 
    deploymentServicePort: number; 
    cacheServicePort: number; 
  };


  constructor(private configService: ConfigurationService) { }

  ngOnInit() {
    this.cm = this.configService.settings.cm;
    this.cc = this.configService.settings.cc;
  }

}
