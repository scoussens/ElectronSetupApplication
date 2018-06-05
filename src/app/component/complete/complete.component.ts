import { Component, OnInit } from '@angular/core';
import { NavService } from '../../services/nav.service';

@Component({
  selector: 'app-complete',
  templateUrl: './complete.component.html',
  styleUrls: ['./complete.component.scss']
})
export class CompleteComponent implements OnInit {
  
  constructor(private navService: NavService) {}

  ngOnInit() {
    this.navService.setBottomLinks(null, null);
  }

}
