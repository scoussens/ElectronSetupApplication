import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigurationComponentsComponent } from './configuration-components.component';

describe('ConfigurationComponentsComponent', () => {
  let component: ConfigurationComponentsComponent;
  let fixture: ComponentFixture<ConfigurationComponentsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConfigurationComponentsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConfigurationComponentsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
