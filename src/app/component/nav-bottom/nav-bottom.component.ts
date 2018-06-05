import { Component, OnInit } from '@angular/core';
import { NavLink } from '../../services/nav.models';
import { NavService } from './../../services/nav.service';

@Component({
  selector: 'app-nav-bottom',
  templateUrl: './nav-bottom.component.html',
  styleUrls: ['./nav-bottom.component.scss']
})
export class NavBottomComponent implements OnInit {
  prevLink: NavLink;
  nextLink: NavLink;
  
  constructor(private navService: NavService) { }

  ngOnInit() {
    this.navService.bottomNavLinks$.subscribe(
      navLinks => {
        this.prevLink = navLinks.prev;
        this.nextLink = navLinks.next;
      },
      err => console.log(err),
      () => console.log('Navigation completed.'));
  }

  enableNextRoute() {
    this.navService.enableTopLink(this.nextLink.name);
  }
}
