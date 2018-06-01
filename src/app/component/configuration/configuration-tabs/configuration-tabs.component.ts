import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-configuration-tabs',
  templateUrl: './configuration-tabs.component.html',
  styleUrls: ['./configuration-tabs.component.scss']
})
export class ConfigurationTabsComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  onTabSelect(event) {
    console.log(event);
  }

}
