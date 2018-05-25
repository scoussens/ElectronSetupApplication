import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-nav-bottom',
  templateUrl: './nav-bottom.component.html',
  styleUrls: ['./nav-bottom.component.scss']
})
export class NavBottomComponent implements OnInit {
  @Input() linkPrev = null;
  @Input() linkNext = null;
  
  constructor() { }

  ngOnInit() {
  }

}
