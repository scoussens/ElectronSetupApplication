import { Injectable } from '@angular/core';

export interface NavLink {
  name: string
  route: string
  enabled: boolean
  children: NavLink[]
}

@Injectable({
  providedIn: 'root'
})
export class NavService {
  private navLinks: NavLink[] = [
    {
      name: 'Welcome',
      route: '/welcome',
      enabled: true,
      children: []
    },
    {
      name: 'License',
      route: '/license',
      enabled: false,
      children: []
    },
    {
      name: 'Configuration',
      route: '/configuration',
      enabled: false,
      children: [
        {
          name: 'Components',
          route: 'welcome',
          enabled: true,
          children: []
        },
        {
          name: 'SQL',
          route: 'welcome',
          enabled: false,
          children: []
        },
        {
          name: 'Website',
          route: 'welcome',
          enabled: false,
          children: []
        },
        {
          name: 'Platform',
          route: 'welcome',
          enabled: false,
          children: []
        }
      ]
    },
    {
      name: 'Confirmation',
      route: '/confirmation',
      enabled: false,
      children: []
    },
    {
      name: 'Installation',
      route: '/installation',
      enabled: false,
      children: []
    },
    {
      name: 'Complete',
      route: '/complete',
      enabled: false,
      children: []
    }
  ]

  constructor() { }

  enableParent(name: string) {
    let link = this.getLink(name);
    link.enabled = true;
    return link;
  }

  enableChild(parentName: string, childName: string) {
    let link = this.getChildLink(parentName, childName);
    link.enabled = true;
    return link;
  }

  getLinks() {
    return this.navLinks;
  }

  getLink(name: string) {
    let link = this.navLinks.find(item => item.name.toLowerCase() === name.toLowerCase());
    return link;
  }

  getChildLink(parentName: string, childName: string) {
    let link = this.getLink(parentName);
    let child = link.children.find(item => item.name.toLowerCase() === childName.toLowerCase());
    return child;
  }
}
