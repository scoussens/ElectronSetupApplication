import { Component, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { AutoCompleteComponent } from '@progress/kendo-angular-dropdowns';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/filter';
import 'rxjs/add/operator/switchMap';
import { User } from '../../services/configuration.models';
import { ConfigurationService } from '../../services/configuration.service';

@Component({
  selector: 'app-user-picker',
  templateUrl: './user-picker.component.html',
  styleUrls: ['./user-picker.component.scss']
})
export class UserPickerComponent implements OnInit {
  @ViewChild('autocomplete') public autocomplete: AutoCompleteComponent;
  private _username = '';
  private _user = null;
  users: User[];

  @Input()
  get username() { return this._username; }
  @Output() usernameChange = new EventEmitter<string>();
  set username(val) {
    this._username = val;
    this.usernameChange.emit(this._username);
  }

  @Input()
  get user() { return this._user; }
  @Output() userChange = new EventEmitter<User>();
  set user(val) {
    this._user = val;
    this.userChange.emit(this._user);
  }

  constructor(private cfgService: ConfigurationService) { }

  ngOnInit() {

  }

  ngAfterViewInit() {
    //Called after ngAfterContentInit when the component's view has been initialized. Applies to components only.
    //Add 'implements AfterViewInit' to the class.

    // parse the existing value if it exsits and pull the user value
    this.cfgService
      .findAdUsers(this.username.split('\\')[1] || null)
      .do(() => this.autocomplete.loading = true)
      .subscribe(
        users => {
          this.users = users.output;
          this.user = users.output[0] || null;
          this.autocomplete.loading = false;
        },
        err => console.log(err));

    // setup the filter change event to pull a new array of users
    this.autocomplete.filterChange.asObservable()
      .filter(value => value.length > 2)
      .do(() => this.autocomplete.loading = true)
      .debounceTime(250)
      .switchMap(value => this.cfgService.findAdUsers(value))
      .subscribe(data => {
        this.users = data.output;
        this.autocomplete.loading = false;
        this.autocomplete.toggle(true);
      },
        err => console.log(err));
  }

  open(event) {
    console.log('open', event);
  }

  valueChange(value: User) {
    this.username = value.loginValue;
  }

}
