import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ValidatedPasswordComponent } from './validated-password.component';

describe('ValidatedPasswordComponent', () => {
  let component: ValidatedPasswordComponent;
  let fixture: ComponentFixture<ValidatedPasswordComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ValidatedPasswordComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ValidatedPasswordComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
