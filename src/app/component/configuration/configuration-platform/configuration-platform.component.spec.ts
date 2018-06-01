import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigurationPlatformComponent } from './configuration-platform.component';

describe('ConfigurationPlatformComponent', () => {
  let component: ConfigurationPlatformComponent;
  let fixture: ComponentFixture<ConfigurationPlatformComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConfigurationPlatformComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConfigurationPlatformComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
