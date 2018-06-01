import { Component, OnInit, ViewChild } from '@angular/core';
import { AutoCompleteComponent } from '@progress/kendo-angular-dropdowns';
import 'rxjs/add/operator/debounceTime';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/take';
import { NavLink, NavService } from '../../services/nav.service';
import { PowershellService } from '../../services/powershell.service';

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

  constructor(private navService: NavService, private psService: PowershellService) { }

  ngOnInit() {
    this.linkNext = this.navService.getLink('Confirmation');
    this.linkPrev = this.navService.getLink('License');
  }
}
