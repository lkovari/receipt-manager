import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ActivatedRoute } from '@angular/router';

import { ReceiptList } from './receipt-list';
import { provideZonelessChangeDetection } from '@angular/core';

describe('ReceiptList', () => {
  let component: ReceiptList;
  let fixture: ComponentFixture<ReceiptList>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ReceiptList],
      providers: [
        provideZonelessChangeDetection(),
        { provide: ActivatedRoute, useValue: { snapshot: { data: { receipts: null } } } }
      ]
    })
    .compileComponents();
  });

  it('should create', () => {
    fixture = TestBed.createComponent(ReceiptList);
    component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
