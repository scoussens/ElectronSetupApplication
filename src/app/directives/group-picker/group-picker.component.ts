import { Component, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { AutoCompleteComponent } from '@progress/kendo-angular-dropdowns';
import 'rxjs/add/operator/debounceTime';
import { Group } from '../../services/configuration.models';
import { ConfigurationService } from './../../services/configuration.service';

@Component({
  selector: 'app-group-picker',
  templateUrl: './group-picker.component.html',
  styleUrls: ['./group-picker.component.scss']
})
export class GroupPickerComponent implements OnInit {
  @ViewChild('autocomplete') public autocomplete: AutoCompleteComponent;
  private _groupname = '';

  groups: Group[];
  group: Group = null;
  @Input()
  get groupname() { return this._groupname; }
  @Output() groupnameChange = new EventEmitter<string>();
  set groupname(val) {
    this._groupname = val;
    this.groupnameChange.emit(this._groupname);
  }

  constructor(private cfgService: ConfigurationService) { }

  ngOnInit() {

  }

  ngAfterViewInit() {
    //Called after ngAfterContentInit when the component's view has been initialized. Applies to components only.
    //Add 'implements AfterViewInit' to the class.
    // parse the existing value if it exsits and pull the user value
    this.cfgService
      .findAdGroups(this.groupname.split('\\')[1] || null)
      .do(() => this.autocomplete.loading = true)
      .subscribe(
        groups => {
          this.groups = groups.output;
          this.group = groups.output[0] || null;
          this.autocomplete.loading = false;
        },
        err => console.log(err));

    this.autocomplete.filterChange.asObservable()
      .filter(value => value.length > 2)
      .do(() => this.autocomplete.loading = true)
      .debounceTime(250)
      .switchMap(value => this.cfgService.findAdGroups(value))
      .subscribe(data => {
        this.groups = data.output;
        this.autocomplete.loading = false;
        this.autocomplete.toggle(true);
      });
  }

  open(event) {
    console.log('open', event);
  }

  valueChange(value: Group) {
    this.groupname = value.loginValue;
    this.group = value;
  }
}
