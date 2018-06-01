import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../../../services/configuration.service';

@Component({
  selector: 'app-configuration-platform',
  templateUrl: './configuration-platform.component.html',
  styleUrls: ['./configuration-platform.component.scss']
})
export class ConfigurationPlatformComponent implements OnInit {
  platform: { 
    useAppPool: boolean; 
    platformUsername: string; 
    platformPassword: string; 
    rmUsePlatformAccount: boolean; 
    rmUsername: string; 
    rmPassword: string; 
    cmUsePlatformAccount: boolean; 
    cmUsername: string; 
    cmPassword: string; 
    adUsePlatformAccount: boolean; 
    adUsername: string; 
    adPassword: string; 
    adRoot: string; 
  };

  constructor(private configService: ConfigurationService) { }

  ngOnInit() {
    this.platform = this.configService.settings.platform;
  }

}
