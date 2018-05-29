import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ComponentsConfigurationComponent } from './components-configuration.component';

describe('ComponentsConfigurationComponent', () => {
  let component: ComponentsConfigurationComponent;
  let fixture: ComponentFixture<ComponentsConfigurationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ComponentsConfigurationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ComponentsConfigurationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
