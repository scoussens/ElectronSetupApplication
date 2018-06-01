import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigurationWebsiteComponent } from './configuration-website.component';

describe('ConfigurationWebsiteComponent', () => {
  let component: ConfigurationWebsiteComponent;
  let fixture: ComponentFixture<ConfigurationWebsiteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConfigurationWebsiteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConfigurationWebsiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
