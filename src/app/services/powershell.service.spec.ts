import { TestBed, inject } from '@angular/core/testing';

import { PowershellService } from './powershell.service';

describe('PowershellService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [PowershellService]
    });
  });

  it('should be created', inject([PowershellService], (service: PowershellService) => {
    expect(service).toBeTruthy();
  }));
});
