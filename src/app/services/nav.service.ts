import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { NavBottomLinkState, NavLink } from './nav.models';

@Injectable({
  providedIn: 'root'
})
export class NavService {
  topNavLinks$ = new Subject<NavLink[]>();
  private topNavLinks: NavLink[];
  bottomNavLinks$ = new Subject<NavBottomLinkState>();
  private bottomNavLinks: NavBottomLinkState = {
    next: new NavLink('Let\'s get started!', '/welcome', true),
    prev: null
  };

  constructor() { }

  initLinks(navLinks: NavLink[]) {
    this.topNavLinks = navLinks;
    this.topNavLinks$.next(this.topNavLinks);
  }

  enableTopLink(name: string) {
    let link = this.topNavLinks.find(link => link.name.toLowerCase() === name.toLowerCase());
    if(link) {
      link.enabled.top = true;
    }
    this.topNavLinks$.next(this.topNavLinks);
  }

  setBottomLinks(namePrev: string, nameNext: string, prevText?: string, nextText?: string) {
    this.bottomNavLinks.prev = this.topNavLinks.find(link => link.name === namePrev);
    if(this.bottomNavLinks.prev) {
      this.bottomNavLinks.prev.text = prevText || null;
    }
    this.bottomNavLinks.next = this.topNavLinks.find(link => link.name === nameNext);
    if(this.bottomNavLinks.next) {
      this.bottomNavLinks.next.text = nextText || null;
    }
    this.bottomNavLinks$.next(this.bottomNavLinks);
  }

  enableNextBottomLink() {
    if(this.bottomNavLinks.next) {
      this.bottomNavLinks.next.enabled.bottom = true;
      this.bottomNavLinks$.next(this.bottomNavLinks);
    }
  }

  enablePrevBottomLink() {
    if(this.bottomNavLinks.prev) {
      this.bottomNavLinks.prev.enabled.bottom = true;
      this.bottomNavLinks$.next(this.bottomNavLinks);
    }
  }
}
