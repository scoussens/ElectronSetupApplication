import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from './../../../services/configuration.service';

@Component({
  selector: 'app-configuration-components',
  templateUrl: './configuration-components.component.html',
  styleUrls: ['./configuration-components.component.scss']
})
export class ConfigurationComponentsComponent implements OnInit {
  components: { installAll: boolean; installDb: boolean; installWebsite: boolean; installServices: boolean; installMdt: boolean; installSsrs: boolean; };

  constructor(private configService: ConfigurationService) { }

  ngOnInit() {
    this.components = this.configService.settings.components;
  }

}
