import { Component, OnInit } from '@angular/core';
import { ConfigMgrSettings, ControlCenterSettings } from './../../../services/configuration.models';
import { ConfigurationService } from './../../../services/configuration.service';

@Component({
  selector: 'app-configuration-databases',
  templateUrl: './configuration-databases.component.html',
  styleUrls: ['./configuration-databases.component.scss']
})
export class ConfigurationDatabasesComponent implements OnInit {
  cm: ConfigMgrSettings;
  cc: ControlCenterSettings;


  constructor(private configService: ConfigurationService) { }

  ngOnInit() {
    this.cm = this.configService.settings.cm;
    this.cc = this.configService.settings.cc;
  }

}
