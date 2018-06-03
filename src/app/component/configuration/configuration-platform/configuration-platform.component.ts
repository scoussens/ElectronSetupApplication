import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../../../services/configuration.service';
import { PlatformSettings } from './../../../services/configuration.models';

@Component({
  selector: 'app-configuration-platform',
  templateUrl: './configuration-platform.component.html',
  styleUrls: ['./configuration-platform.component.scss']
})
export class ConfigurationPlatformComponent implements OnInit {
  platform: PlatformSettings;

  constructor(private configService: ConfigurationService) { }

  ngOnInit() {
    this.platform = this.configService.settings.platform;
  }

}
