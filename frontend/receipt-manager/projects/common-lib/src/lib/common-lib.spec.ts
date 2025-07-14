import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CommonLib } from './common-lib';
import { provideZonelessChangeDetection } from '@angular/core';

describe('CommonLib', () => {
  let component: CommonLib;
  let fixture: ComponentFixture<CommonLib>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CommonLib],
      providers: [provideZonelessChangeDetection()]
    })
    .compileComponents();
  });

  it('should create', () => {
    fixture = TestBed.createComponent(CommonLib);
    component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
