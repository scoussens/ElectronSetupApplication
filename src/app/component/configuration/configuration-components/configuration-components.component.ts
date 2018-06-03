import { Component, OnInit } from '@angular/core';
import { ComponentSettings } from './../../../services/configuration.models';
import { ConfigurationService } from './../../../services/configuration.service';

@Component({
  selector: 'app-configuration-components',
  templateUrl: './configuration-components.component.html',
  styleUrls: ['./configuration-components.component.scss']
})
export class ConfigurationComponentsComponent implements OnInit {
  components: ComponentSettings;

  constructor(private configService: ConfigurationService) { }

  ngOnInit() {
    this.components = this.configService.settings.components;
  }

}
