import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-confirmation',
  templateUrl: './confirmation.component.html',
  styleUrls: ['./confirmation.component.scss']
})
export class ConfirmationComponent implements OnInit {
  linkNext = '/installation';
  linkPrev = '/configuration';

  constructor() { }

  ngOnInit() {
  }

}
