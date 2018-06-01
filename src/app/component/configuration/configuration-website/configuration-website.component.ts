import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../../../services/configuration.service';

@Component({
  selector: 'app-configuration-website',
  templateUrl: './configuration-website.component.html',
  styleUrls: ['./configuration-website.component.scss']
})
export class ConfigurationWebsiteComponent implements OnInit {
  website: { 
    appPoolUser: string; 
    appPoolPassword: string; 
    adminGroup: string; 
    installDir: string; 
    sitename: string; 
    hostname: string; 
    sitePort: number; 
    sslPort: number; 
    sslCert: string; 
    registerDns: boolean; 
  };

  constructor(private configService: ConfigurationService) { }

  ngOnInit() {
    this.website = this.configService.settings.website;
  }

}
