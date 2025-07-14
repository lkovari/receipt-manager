import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeftSideBar } from './left-side-bar';
import { provideZonelessChangeDetection } from '@angular/core';

describe('LeftSideBar', () => {
  let component: LeftSideBar;
  let fixture: ComponentFixture<LeftSideBar>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [LeftSideBar],
      providers: [provideZonelessChangeDetection()]
    })
    .compileComponents();
  });

  it('should create', () => {
    fixture = TestBed.createComponent(LeftSideBar);
    component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
