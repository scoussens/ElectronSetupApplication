import { Component, OnInit } from '@angular/core';
import { NavLink, NavService } from '../../services/nav.service';

@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.scss']
})
export class NavComponent implements OnInit {
  navLinks: NavLink[] = [];

  constructor(private navService: NavService) {
    
  }

  ngOnInit() {
    this.navLinks = this.navService.getLinks();
    console.log(this.navLinks)
  }

}
