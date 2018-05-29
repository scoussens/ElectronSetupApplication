import { Component, OnInit } from '@angular/core';
import { NavLink, NavService } from '../../services/nav.service';

@Component({
  selector: 'app-complete',
  templateUrl: './complete.component.html',
  styleUrls: ['./complete.component.scss']
})
export class CompleteComponent implements OnInit {
  linkNext: NavLink = null;
  linkPrev: NavLink = null;
  
  constructor(private navService: NavService) {}

  ngOnInit() {
    this.linkPrev = this.navService.getLink('Welcome');
  }

}
