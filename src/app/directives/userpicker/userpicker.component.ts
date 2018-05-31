import { Component, OnInit, ViewChild, Output, EventEmitter, Input } from '@angular/core';
import { PowershellService } from '../../services/powershell.service';
import { AutoCompleteComponent } from '@progress/kendo-angular-dropdowns';
import { PsCommandType } from '../../services/powershell.models';

@Component({
  selector: 'app-userpicker',
  templateUrl: './userpicker.component.html',
  styleUrls: ['./userpicker.component.scss']
})
export class UserpickerComponent implements OnInit {
  @ViewChild('autocomplete') public autocomplete: AutoCompleteComponent;
  users: [{ CN: string, DisplayName: string, SamAccountName: string }];

  _username = '';

  @Input()
  get username() { return this._username; }

  @Output() usernameChange = new EventEmitter<string>();
  set username(val) {
    this._username = val;
    this.usernameChange.emit(this._username);
  }

  constructor(private psService: PowershellService) { }

  ngOnInit() {

  }

  filterUsers(value) {
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
    this.username = value;
  }

}
