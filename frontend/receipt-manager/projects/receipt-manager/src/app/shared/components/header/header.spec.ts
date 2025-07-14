import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Header } from './header';
import { provideZonelessChangeDetection } from '@angular/core';

describe('Header', () => {
  let component: Header;
  let fixture: ComponentFixture<Header>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Header],
      providers: [provideZonelessChangeDetection()]
    })
    .compileComponents();
  });

  it('should create', () => {
    fixture = TestBed.createComponent(Header);
    component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
