import { Component, OnInit } from '@angular/core';
import { NavLink, NavService } from '../../services/nav.service';

@Component({
  selector: 'app-license',
  templateUrl: './license.component.html',
  styleUrls: ['./license.component.scss']
})
export class LicenseComponent implements OnInit {
  linkNext: NavLink = null;
  linkPrev: NavLink = null;

  constructor(private navService: NavService) {}

  ngOnInit() {
    this.linkNext = this.navService.getLink('Configuration');
    this.linkPrev = this.navService.getLink('Welcome');
  }

}
