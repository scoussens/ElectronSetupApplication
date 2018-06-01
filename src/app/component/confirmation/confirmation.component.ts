import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../../services/configuration.service';
import { ConfigurationSettings } from './../../services/configuration.service';
import { NavLink, NavService } from './../../services/nav.service';

@Component({
  selector: 'app-confirmation',
  templateUrl: './confirmation.component.html',
  styleUrls: ['./confirmation.component.scss']
})
export class ConfirmationComponent implements OnInit {
  linkNext: NavLink = null;
  linkPrev: NavLink = null;
  settings: ConfigurationSettings;

  constructor(private navService: NavService, private cfgService: ConfigurationService) {}

  ngOnInit() {
    this.settings = this.cfgService.settings;
    this.linkNext = this.navService.getLink('Installation');
    this.linkPrev = this.navService.getLink('Configuration');
  }

  getKeys(obj: any) {
    return Object.keys(obj);
  }

}
