import { TestBed } from '@angular/core/testing';
import { ShowTooltipDirective } from './show-tooltip';
import { ElementRef, provideZonelessChangeDetection, Renderer2 } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

describe('ShowTooltipDirective', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ShowTooltipDirective],
      providers: [
        provideZonelessChangeDetection(),
        { provide: ActivatedRoute, useValue: {} }
      ]
    });
  });

  it('should create an instance', () => {
    const elementRef = {} as ElementRef;
    const renderer = {} as Renderer2;
    const directive = new ShowTooltipDirective(elementRef, renderer);
    expect(directive).toBeTruthy();
  });
});
