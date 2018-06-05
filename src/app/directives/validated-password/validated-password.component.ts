import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import 'rxjs/add/operator/debounceTime';
import { User } from '../../services/configuration.models';
import { ConfigurationService } from '../../services/configuration.service';

@Component({
  selector: 'app-validated-password',
  templateUrl: './validated-password.component.html',
  styleUrls: ['./validated-password.component.scss']
})
export class ValidatedPasswordComponent implements OnInit {
  _user: User;
  _password = '';
  isValid = {
    status: true,
    message: 'Invalid or account locked'
  };

  @Input()
  get user() {
    return this._user;
  }
  @Output() userChange = new EventEmitter<User>();
  set user(val) {
    this._user = val;
    this.userChange.emit(this._user);
  }

  @Input()
  get password() { return this._password; }

  @Output() passwordChange = new EventEmitter<string>();
  set password(val) {
    this._password = val;
    this.passwordChange.emit(this._password);
  }

  constructor(private cfgService: ConfigurationService) { }

  ngOnInit() {
    this.userChange
      .asObservable()
      .debounceTime(500)
      .switchMap(value => this.cfgService.validateAdCredentials(value.samAccountName || null, this.password))
      .subscribe(
        valid => this.isValid.status = valid.output,
        err => {
          console.log(err);
          this.isValid.status = false;
        });

    this.passwordChange
      .asObservable()
      .debounceTime(500)
      .switchMap(value => this.cfgService.validateAdCredentials(this.user ? this.user.samAccountName : null, value))
      .subscribe(
        valid => this.isValid.status = valid.output,
        err => {
          console.log(err);
          this.isValid.status = false;
        });
  }
}
