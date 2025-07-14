import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Home } from './home';
import { provideZonelessChangeDetection } from '@angular/core';

describe('Home', () => {
  let component: Home;
  let fixture: ComponentFixture<Home>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Home],
      providers: [provideZonelessChangeDetection()]
    })
    .compileComponents();
  });

  it('should create', () => {
    fixture = TestBed.createComponent(Home);
    component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
