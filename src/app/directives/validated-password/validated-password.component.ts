import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ConfigurationService } from '../../services/configuration.service';

@Component({
  selector: 'app-validated-password',
  templateUrl: './validated-password.component.html',
  styleUrls: ['./validated-password.component.scss']
})
export class ValidatedPasswordComponent implements OnInit {
  @Input() username = '';
  _password = '';
  isValid = {
    status: true,
    message: 'Invalid or account locked'
  };

  @Input()
  get password() { return this._password; }

  @Output() passwordChange = new EventEmitter<string>();
  set password(val) {
    this._password = val;
    this.passwordChange.emit(this._password);
  }
  
  constructor(private cfgService: ConfigurationService) { }

  ngOnInit() {
    this.passwordChange
      .asObservable()
      .debounceTime(250)
      .switchMap(value => this.cfgService.validateAdCredentials(this.username, value))
      .subscribe(valid => this.isValid.status = valid.output);
  }
}
