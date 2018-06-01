import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigurationTabsComponent } from './configuration-tabs.component';

describe('ConfigurationTabsComponent', () => {
  let component: ConfigurationTabsComponent;
  let fixture: ComponentFixture<ConfigurationTabsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConfigurationTabsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConfigurationTabsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
