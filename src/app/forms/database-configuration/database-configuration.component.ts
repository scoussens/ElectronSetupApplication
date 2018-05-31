import { Component, OnInit } from '@angular/core';
import { ConfigurationService, ConfigurationSettings } from '../../services/configuration.service';

@Component({
  selector: 'app-database-configuration',
  templateUrl: './database-configuration.component.html',
  styleUrls: ['./database-configuration.component.scss']
})
export class DatabaseConfigurationComponent implements OnInit {
  config: ConfigurationSettings;
  dbUsername: string = '';

  constructor(private configService: ConfigurationService) { }

  ngOnInit() {
    this.config = this.configService.settings;
  }

}
