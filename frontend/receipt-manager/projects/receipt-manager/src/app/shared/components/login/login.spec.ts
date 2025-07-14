import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Login } from './login';
import { provideZonelessChangeDetection } from '@angular/core';
import { provideHttpClient } from '@angular/common/http';

describe('Login', () => {
  let component: Login;
  let fixture: ComponentFixture<Login>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Login],
      providers: [provideZonelessChangeDetection(), provideHttpClient()]
    })
    .compileComponents();
  });

  it('should create', () => {
    fixture = TestBed.createComponent(Login);
    component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
