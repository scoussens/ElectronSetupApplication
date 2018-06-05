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

  setAllTrue(event) {
    if(event === false) {
      return;
    }

    this.components.installDb.value = true;
    this.components.installMdt.value = true;
    this.components.installServices.value = true;
    this.components.installSsrs.value = true;
    this.components.installWebsite.value = true;
  }
}
