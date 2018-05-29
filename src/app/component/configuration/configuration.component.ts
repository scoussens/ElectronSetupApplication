import { Component, OnInit } from '@angular/core';
import { NavLink, NavService } from '../../services/nav.service';
import { PsResult } from './../../services/powershell.models';

@Component({
  selector: 'app-configuration',
  templateUrl: './configuration.component.html',
  styleUrls: ['./configuration.component.scss']
})
export class ConfigurationComponent implements OnInit {
  linkNext: NavLink = null;
  linkPrev: NavLink = null;
  title = 'Configuration';
  messages: PsResult[] = [];

  constructor(private navService: NavService) {}

  ngOnInit() {
    this.linkNext = this.navService.getLink('Confirmation');
    this.linkPrev = this.navService.getLink('License');
  }
}
