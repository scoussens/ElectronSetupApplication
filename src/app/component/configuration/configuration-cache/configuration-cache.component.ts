import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from './../../../services/configuration.service';

@Component({
  selector: 'app-configuration-cache',
  templateUrl: './configuration-cache.component.html',
  styleUrls: ['./configuration-cache.component.scss']
})
export class ConfigurationCacheComponent implements OnInit {
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
    cacheServicePort: number; };

  constructor(private cfgService: ConfigurationService) { }

  ngOnInit() {
    this.cc = this.cfgService.settings.cc;
  }

}
