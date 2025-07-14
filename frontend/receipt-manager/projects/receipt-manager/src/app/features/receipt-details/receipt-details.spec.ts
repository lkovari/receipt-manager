import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReceiptDetails } from './receipt-details';

describe('ReceiptDetails', () => {
  let component: ReceiptDetails;
  let fixture: ComponentFixture<ReceiptDetails>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ReceiptDetails]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ReceiptDetails);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
