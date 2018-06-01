import { Component, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { AutoCompleteComponent } from '@progress/kendo-angular-dropdowns';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/filter';
import 'rxjs/add/operator/switchMap';
import { PsCommandType } from '../../services/powershell.models';
import { PowershellService } from '../../services/powershell.service';

interface User {
  cn: string,
  displayName: string,
  samAccountName: string
}

@Component({
  selector: 'app-user-picker',
  templateUrl: './user-picker.component.html',
  styleUrls: ['./user-picker.component.scss']
})
export class UserPickerComponent implements OnInit {
  @ViewChild('autocomplete') public autocomplete: AutoCompleteComponent;
  data: User[];
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

  ngAfterViewInit() {
    //Called after ngAfterContentInit when the component's view has been initialized. Applies to components only.
    //Add 'implements AfterViewInit' to the class.
    this.autocomplete.filterChange.asObservable()
      .filter(value => value.length > 2)
      .do(() => this.autocomplete.loading = true)
      .debounceTime(250)
      .switchMap(value => this.psService.invoke(PsCommandType.Script, 'Get-ADUserOrGroup.ps1', [{ samAccountName: value }, { objectClass: 'user' }]))
      .subscribe(data => {
        this.data = data.output;
        this.autocomplete.loading = false;
        this.autocomplete.toggle(true);
      });
  }

  open(event) {
    console.log('open', event);
  }

  select(value) {
    this.username = value;
  }

}
