import { Component, Input, OnInit } from '@angular/core';
import { NavLink, NavService } from './../../services/nav.service';

@Component({
  selector: 'app-nav-bottom',
  templateUrl: './nav-bottom.component.html',
  styleUrls: ['./nav-bottom.component.scss']
})
export class NavBottomComponent implements OnInit {
  @Input() linkPrev: NavLink = null;
  @Input() linkPrevText: string = null;
  @Input() linkNext: NavLink = null;
  @Input() linkNextText: string = null;
  
  constructor(private navService: NavService) { }

  ngOnInit() {
  }

  enableLink(name: string) {
    this.navService.enableParent(name);
  }
}
