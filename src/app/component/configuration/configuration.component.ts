import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-configuration',
  templateUrl: './configuration.component.html',
  styleUrls: ['./configuration.component.scss']
})
export class ConfigurationComponent implements OnInit {
  linkNext = '/confirmation';
  linkPrev = '/license';

  constructor() { }

  ngOnInit() {
  }

}
