import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PlatformConfigurationComponent } from './platform-configuration.component';

describe('PlatformConfigurationComponent', () => {
  let component: PlatformConfigurationComponent;
  let fixture: ComponentFixture<PlatformConfigurationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PlatformConfigurationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PlatformConfigurationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
