import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MainLayout } from './main-layout';
import { provideZonelessChangeDetection } from '@angular/core';

describe('MainLayout', () => {
  let component: MainLayout;
  let fixture: ComponentFixture<MainLayout>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MainLayout],
      providers: [provideZonelessChangeDetection()]
    })
    .compileComponents();
  });

  it('should create', () => {
    fixture = TestBed.createComponent(MainLayout);
    component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
