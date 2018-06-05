import { Component, OnInit } from '@angular/core';
import { NavLink } from '../../services/nav.models';
import { NavService } from '../../services/nav.service';

@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.scss']
})
export class NavComponent implements OnInit {
  navLinks: NavLink[] = [
    new NavLink('Welcome', '/welcome', true, null, true),
    new NavLink('License', '/license', false, 'Let\s get started!', true),
    new NavLink('Configuration', '/configuration', false, null, true),
    new NavLink('Confirmation', '/confirmation', false, null, true),
    new NavLink('Installation', '/installation', false, null, true),
    new NavLink('Complete', '/complete', false, null, true)
];

  constructor(private navService: NavService) {
    
  }

  ngOnInit() {
    this.navService.initLinks(this.navLinks);
    this.navService.topNavLinks$.subscribe(
      navLinks => this.navLinks = navLinks,
      err => console.log(err),
      () => console.log('Navigation completed.')
    );
    console.log(this.navLinks)
  }

}
