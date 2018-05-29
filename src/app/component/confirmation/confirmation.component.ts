import { Component, OnInit } from '@angular/core';
import { NavLink, NavService } from './../../services/nav.service';

@Component({
  selector: 'app-confirmation',
  templateUrl: './confirmation.component.html',
  styleUrls: ['./confirmation.component.scss']
})
export class ConfirmationComponent implements OnInit {
  linkNext: NavLink = null;
  linkPrev: NavLink = null;

  constructor(private navService: NavService) {}

  ngOnInit() {
    this.linkNext = this.navService.getLink('Installation');
    this.linkPrev = this.navService.getLink('Configuration');
  }

}
