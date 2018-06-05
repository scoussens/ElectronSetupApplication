import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { ConfigurationService } from './../../services/configuration.service';
import { NavService } from './../../services/nav.service';

@Component({
  selector: 'app-installation',
  templateUrl: './installation.component.html',
  styleUrls: ['./installation.component.scss']
})
export class InstallationComponent implements OnInit {
  @ViewChild('logViewer') private logViewerContainer: ElementRef;
  title = 'Install Control Center';
  messages: string = '';

  constructor(private cfgService: ConfigurationService, private router: Router, private navService: NavService) {}

  ngOnInit() {
    this.navService.setBottomLinks(null, null);
  }

  scrollToBottom() {
    try {
      this.logViewerContainer.nativeElement.scrollTop = this.logViewerContainer.nativeElement.scrollHeight;
    } catch(err) {
      console.log(err);
    }
  }

  runPrereq() {
    this.cfgService.saveConfig();

    this.cfgService
      .installPrereqs()
      .subscribe(
        data => {
          this.messages += data.output;
          this.scrollToBottom();
        },
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
        data => {
          this.messages += data.output;
          this.scrollToBottom();
        },
        err => this.messages += err.output,
        () => {
          console.log('Installation completed.')
          this.navService.enableTopLink('Complete');
          this.router.navigate(['complete']);
        }
      );
  }
}
