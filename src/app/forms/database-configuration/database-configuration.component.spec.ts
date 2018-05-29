import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DatabaseConfigurationComponent } from './database-configuration.component';

describe('DatabaseConfigurationComponent', () => {
  let component: DatabaseConfigurationComponent;
  let fixture: ComponentFixture<DatabaseConfigurationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DatabaseConfigurationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DatabaseConfigurationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
