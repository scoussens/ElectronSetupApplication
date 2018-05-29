import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NavLink } from '../../services/nav.service';
import { PsCommandType, PsResult } from '../../services/powershell.models';
import { PowershellService } from '../../services/powershell.service';
import { NavService } from './../../services/nav.service';

@Component({
  selector: 'app-installation',
  templateUrl: './installation.component.html',
  styleUrls: ['./installation.component.scss']
})
export class InstallationComponent implements OnInit {
  linkNext: NavLink = null;
  linkPrev: NavLink = null;
  title = 'Configuration';
  messages: PsResult[] = [];

  constructor(private psService: PowershellService, private router: Router, private navService: NavService) {}

  ngOnInit() {
  }

  runStream() {
    this.psService
      .stream(PsCommandType.Script, "Test-Stream.ps1", [
        { Number: 1 },
        { Letter: "A" },
        { Text: "Hello world." },
        { ComputerName: "localhost" },
        { InternetAddress: "http://www.google.com" }
      ])
      .subscribe(
        data => this.messages.push(data.output),
        err => {
          console.log(err);
        },
        () => {
          console.log('Installation completed.')
          this.navService.enableParent('Complete');
          this.router.navigate(['complete']);
        }
      );
  }

  runError() {
    this.psService
      .stream(PsCommandType.Script, "Test-Error.ps1", [
        { Number: 1 },
        { Letter: "A" },
        { Text: "Hello world." },
        { ComputerName: "localhost" },
        { InternetAddress: "http://www.google.com" }
      ])
      .subscribe(
        data => this.messages.push(data.output),
        err => {
          console.log(err);
          this.messages.push(err.message);
          this.messages.push(err.output);
        },
        () => {
          console.log('Installation completed.')
          this.navService.enableParent('Complete');
          this.router.navigate(['complete']);
        }
      );
  }
}
