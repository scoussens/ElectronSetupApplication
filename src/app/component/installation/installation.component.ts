import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NavLink } from '../../services/nav.service';
import { ConfigurationService } from './../../services/configuration.service';
import { NavService } from './../../services/nav.service';

@Component({
  selector: 'app-installation',
  templateUrl: './installation.component.html',
  styleUrls: ['./installation.component.scss']
})
export class InstallationComponent implements OnInit {
  linkNext: NavLink = null;
  linkPrev: NavLink = null;
  title = 'Configuration';
  messages: string[] = [];

  constructor(private cfgService: ConfigurationService, private router: Router, private navService: NavService) {}

  ngOnInit() {
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
          this.navService.enableParent('Complete');
          this.router.navigate(['complete']);
        }
      );
  }
}
