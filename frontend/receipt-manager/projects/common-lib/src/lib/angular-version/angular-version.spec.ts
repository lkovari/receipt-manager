import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AngularVersion } from './angular-version';
import { provideZonelessChangeDetection } from '@angular/core';

describe('AngularVersion', () => {
  let component: AngularVersion;
  let fixture: ComponentFixture<AngularVersion>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AngularVersion],
      providers: [provideZonelessChangeDetection()]
    })
    .compileComponents();
  });

  it('should create', () => {
    fixture = TestBed.createComponent(AngularVersion);
    component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });

  it('should display the Angular version', () => {
    fixture = TestBed.createComponent(AngularVersion);
    component = fixture.componentInstance;
    fixture.detectChanges();
    const compiled = fixture.nativeElement as HTMLElement;
    expect(compiled.textContent).toContain('Angular version');
    expect(compiled.textContent).toContain(component.angularVersion);
  });
});
