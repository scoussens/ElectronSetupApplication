import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ConfigurationService } from './../../services/configuration.service';
import { NavService } from './../../services/nav.service';

@Component({
  selector: 'app-installation',
  templateUrl: './installation.component.html',
  styleUrls: ['./installation.component.scss']
})
export class InstallationComponent implements OnInit {
  title = 'Configuration';
  messages: string[] = [];

  constructor(private cfgService: ConfigurationService, private router: Router, private navService: NavService) {}

  ngOnInit() {
    this.navService.setBottomLinks(null, null);
  }

  runPrereq() {
    this.cfgService.saveConfig();

    this.cfgService
      .installPrereqs()
      .subscribe(
        data => this.messages.push(data.output),
        err => console.log(err),
        () => console.log('Pre-req installation complete, you may need to restart the server.')
      )
  }

  runInstall() {
    // save configuration to local storage
    this.cfgService.saveConfig();

    // run the installer script
    this.cfgService
      .installPortal()
      .subscribe(
        data => this.messages.push(data.output),
        err => {
          console.log(err);
        },
        () => {
          console.log('Installation completed.')
          this.navService.enableTopLink('Complete');
          this.router.navigate(['complete']);
        }
      );
  }
}
