import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import 'rxjs/operators/take';
import { PsCommandType, PsResult } from '../../services/powershell.models';
import { PowershellService } from './../../services/powershell.service';

@Component({
  selector: 'app-welcome',
  templateUrl: './welcome.component.html',
  styleUrls: ['./welcome.component.scss']
})
export class WelcomeComponent implements OnInit {
  linkNext = '/license';
  linkPrev = null;
  messages: string[] = ["Waiting for stream..."];
  json: PsResult;

  constructor(private psService: PowershellService, private ref: ChangeDetectorRef) { }

  ngOnInit() {
  }

  runStream() {
    this.psService
      .stream(PsCommandType.Script, 'Test-Stream.ps1', [
        { Number: 1 },
        { Letter: 'A' },
        { Text: 'Hello world.' },
        { ComputerName: 'localhost' },
        { InternetAddress: 'http://www.google.com' }
      ])
      .subscribe(data => {
        console.log(data);
        this.messages.push(data.output);
      }, err => {
        console.log(err);
      });
  }

  runJson() {
    setTimeout(() => this.messages.push('Clicked the JSON button.'), 1000);
    this.psService
      .invoke(PsCommandType.Script, 'Test-Json.ps1', [
        { Number: 1 },
        { Letter: 'A' },
        { Text: 'Hello world.' },
        { ComputerName: 'localhost' },
        { InternetAddress: 'http://www.google.com' }
      ])
      .subscribe(data => {
        console.log(data);
        this.json = data;
      }, err => {
        console.log(err);
      });
  }

}
