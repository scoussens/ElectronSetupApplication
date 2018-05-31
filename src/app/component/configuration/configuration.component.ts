import { Component, OnInit, ViewChild } from '@angular/core';
import { NavLink, NavService } from '../../services/nav.service';
import { PsResult, PsCommandType } from './../../services/powershell.models';
import { PowershellService } from '../../services/powershell.service';
import { Observable } from 'rxjs';
import 'rxjs/add/operator/take';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/debounceTime';
import { AutoCompleteComponent } from '@progress/kendo-angular-dropdowns';

@Component({
  selector: 'app-configuration',
  templateUrl: './configuration.component.html',
  styleUrls: ['./configuration.component.scss']
})
export class ConfigurationComponent implements OnInit {
  @ViewChild('autocomplete') public autocomplete: AutoCompleteComponent;
  linkNext: NavLink = null;
  linkPrev: NavLink = null;
  title = 'Configuration';
  users: [{ CN: string, DisplayName: string, SamAccountName: string }];
  username: string;

  constructor(private navService: NavService, private psService: PowershellService) { }

  ngOnInit() {
    this.linkNext = this.navService.getLink('Confirmation');
    this.linkPrev = this.navService.getLink('License');
  }

  filterUsers(value) {
    console.log(value);
    if (value.length >= 3) {
      this.psService
        .invoke(PsCommandType.Script, 'Find-ADUser.ps1', [{ username: value }])
        .debounceTime(250)
        .take(1)
        .subscribe(data => this.users = data.output);
    } else {
      this.autocomplete.toggle(false);
    }
  }

  selectUser(value) {
    console.log(value);
    this.username = value;
  }
}
