import { Component, OnInit } from '@angular/core';
import { ControlCenterSettings } from './../../../services/configuration.models';
import { ConfigurationService } from './../../../services/configuration.service';

@Component({
  selector: 'app-configuration-cache',
  templateUrl: './configuration-cache.component.html',
  styleUrls: ['./configuration-cache.component.scss']
})
export class ConfigurationCacheComponent implements OnInit {
  cc: ControlCenterSettings;

  constructor(private cfgService: ConfigurationService) { }

  ngOnInit() {
    this.cc = this.cfgService.settings.cc;
  }
}
