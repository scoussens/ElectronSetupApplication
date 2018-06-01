import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigurationDatabasesComponent } from './configuration-databases.component';

describe('ConfigurationDatabasesComponent', () => {
  let component: ConfigurationDatabasesComponent;
  let fixture: ComponentFixture<ConfigurationDatabasesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConfigurationDatabasesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConfigurationDatabasesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
