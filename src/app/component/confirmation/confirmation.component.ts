import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../../services/configuration.service';
import { ConfigurationSettings } from './../../services/configuration.models';
import { NavService } from './../../services/nav.service';

@Component({
  selector: 'app-confirmation',
  templateUrl: './confirmation.component.html',
  styleUrls: ['./confirmation.component.scss']
})
export class ConfirmationComponent implements OnInit {
  settings: ConfigurationSettings;

  constructor(private navService: NavService, private cfgService: ConfigurationService) {}

  ngOnInit() {
    this.settings = this.cfgService.settings;
    this.navService.setBottomLinks('Configuration', 'Installation');
  }

  getKeys(obj: any) {
    return Object.keys(obj);
  }

}
