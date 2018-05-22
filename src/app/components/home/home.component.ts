import { Component, OnInit } from '@angular/core';
import { NpsScript } from '../../../../electron/nps.models';
import { PowershellService } from './../../services/powershell.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  scripts: NpsScript[];

  constructor(private psService: PowershellService) { }

  ngOnInit() {
    this.psService
      .listScripts()
      .then(result => this.scripts = result);
  }
}
