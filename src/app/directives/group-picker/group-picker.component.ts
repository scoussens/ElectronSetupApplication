import { Component, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { AutoCompleteComponent } from '@progress/kendo-angular-dropdowns';
import { ConfigurationService, Group } from './../../services/configuration.service';

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
    this.autocomplete.filterChange.asObservable()
      .filter(value => value.length > 2)
      .do(() => this.autocomplete.loading = true)
      .debounceTime(250)
      .switchMap(value => this.cfgService.findAdGroups(value))
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
