import { Component, OnInit } from '@angular/core';
import { ControlCenterSettings, User } from './../../../services/configuration.models';
import { ConfigurationService } from './../../../services/configuration.service';

@Component({
  selector: 'app-configuration-cache',
  templateUrl: './configuration-cache.component.html',
  styleUrls: ['./configuration-cache.component.scss']
})
export class ConfigurationCacheComponent implements OnInit {
  cc: ControlCenterSettings;
  hostServiceUser: User;

  constructor(private cfgService: ConfigurationService) { }

  ngOnInit() {
    this.cc = this.cfgService.settings.cc;
  }
}
