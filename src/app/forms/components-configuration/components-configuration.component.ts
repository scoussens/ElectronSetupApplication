import { ConfigurationService } from './../../services/configuration.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { PsCommandType } from '../../services/powershell.models';
import { AutoCompleteComponent } from '@progress/kendo-angular-dropdowns';
import { PowershellService } from '../../services/powershell.service';

@Component({
  selector: 'app-components-configuration',
  templateUrl: './components-configuration.component.html',
  styleUrls: ['./components-configuration.component.scss']
})
export class ComponentsConfigurationComponent implements OnInit {
  title = 'Component Installation';
  components: { 
    installAll: boolean; 
    installDb: boolean; 
    installWebsite: boolean; 
    installServices: boolean; 
    installMdt: boolean; 
    installSsrs: boolean; 
  };

  constructor(private configService: ConfigurationService) {
    this.components = this.configService.settings.components;
    console.log(this.components);
  }

  ngOnInit() {

  }
}
