import { ConfigurationSettings } from './../../services/configuration.service';
import { Component, OnInit } from '@angular/core';
import { NavLink, NavService } from './../../services/nav.service';
import { ConfigurationService } from '../../services/configuration.service';

@Component({
  selector: 'app-confirmation',
  templateUrl: './confirmation.component.html',
  styleUrls: ['./confirmation.component.scss']
})
export class ConfirmationComponent implements OnInit {
  linkNext: NavLink = null;
  linkPrev: NavLink = null;
  config: ConfigurationSettings;

  constructor(private navService: NavService, private configService: ConfigurationService) {}

  ngOnInit() {
    this.config = this.configService.settings;
    
    this.linkNext = this.navService.getLink('Installation');
    this.linkPrev = this.navService.getLink('Configuration');
  }

}
