import { Component, OnInit } from '@angular/core';
import { NavService } from '../../services/nav.service';

@Component({
  selector: 'app-license',
  templateUrl: './license.component.html',
  styleUrls: ['./license.component.scss']
})
export class LicenseComponent implements OnInit {
  constructor(private navService: NavService) {}

  ngOnInit() {
    this.navService.setBottomLinks('Welcome', 'Configuration');
  }

}
