import { Component, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { AutoCompleteComponent } from '@progress/kendo-angular-dropdowns';
import { PsCommandType } from '../../services/powershell.models';
import { PowershellService } from '../../services/powershell.service';

interface Group {
  cn: string,
  displayName: string,
  samAccountName: string
}

@Component({
  selector: 'app-group-picker',
  templateUrl: './group-picker.component.html',
  styleUrls: ['./group-picker.component.scss']
})
export class GroupPickerComponent implements OnInit {
  @ViewChild('autocomplete') public autocomplete: AutoCompleteComponent;
  data: Group[];
  _groupname = '';

  @Input()
  get groupname() { return this._groupname; }

  @Output() usernameChange = new EventEmitter<string>();
  set groupname(val) {
    this._groupname = val;
    this.usernameChange.emit(this._groupname);
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
      .switchMap(value => this.psService.invoke(PsCommandType.Script, 'Get-ADUserOrGroup.ps1', [{ samAccountName: value },{ objectClass: 'group'}]))
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
    this.groupname = value;
  }

}
