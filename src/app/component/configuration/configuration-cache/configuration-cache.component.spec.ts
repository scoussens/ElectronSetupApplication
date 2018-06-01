import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigurationCacheComponent } from './configuration-cache.component';

describe('ConfigurationCacheComponent', () => {
  let component: ConfigurationCacheComponent;
  let fixture: ComponentFixture<ConfigurationCacheComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConfigurationCacheComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConfigurationCacheComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
