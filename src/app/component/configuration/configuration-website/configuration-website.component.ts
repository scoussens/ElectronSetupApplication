import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../../../services/configuration.service';
import { User, WebsiteSettings } from './../../../services/configuration.models';

@Component({
  selector: 'app-configuration-website',
  templateUrl: './configuration-website.component.html',
  styleUrls: ['./configuration-website.component.scss']
})
export class ConfigurationWebsiteComponent implements OnInit {
  website: WebsiteSettings;
  appPoolUser: User;

  constructor(private configService: ConfigurationService) { }

  ngOnInit() {
    this.website = this.configService.settings.website;
  }

}
