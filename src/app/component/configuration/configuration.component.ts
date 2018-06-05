import { Component, OnInit } from '@angular/core';
import { NavService } from '../../services/nav.service';
import { PowershellService } from '../../services/powershell.service';

@Component({
  selector: 'app-configuration',
  templateUrl: './configuration.component.html',
  styleUrls: ['./configuration.component.scss']
})
export class ConfigurationComponent implements OnInit {
  title = 'Configuration';

  constructor(private navService: NavService, private psService: PowershellService) { }

  ngOnInit() {
    this.navService.setBottomLinks('License', 'Confirmation');
  }
}
