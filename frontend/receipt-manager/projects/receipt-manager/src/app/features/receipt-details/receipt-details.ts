import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, ActivatedRoute } from '@angular/router';
import { ReceiptListResponse } from '../../core/model/receiptListResponse';
import { ReceiptResponse } from '../../core/model/receiptResponse';
import { ReceiptItem } from '../../core/model/receiptItem';
import { inject } from '@angular/core';

@Component({
  selector: 'app-receipt-details',
  imports: [CommonModule],
  templateUrl: './receipt-details.html',
  styleUrl: './receipt-details.scss'
})
export class ReceiptDetailsComponent implements OnInit {
  private route = inject(ActivatedRoute);
  private router = inject(Router);
  receipt: ReceiptListResponse | null = null;
  receiptResponse: ReceiptResponse | null = null;
  receiptItems: ReceiptItem[] = [];
  showPreview = false;
  currency: string = '';

  constructor() {
    const nav = this.router.getCurrentNavigation();
    this.receipt = nav?.extras.state?.['receipt'];
  }

  ngOnInit() {
    const resolved: ReceiptResponse | null = this.route.snapshot.data['receiptDetail'] ?? null;
    this.receiptResponse = resolved;
    this.receiptItems = resolved?.receipt_data?.items ?? [];
    this.currency = resolved?.receipt_data?.items.length ? resolved?.receipt_data?.items[0].currency : '';
  }

  goBack() {
    this.router.navigate(['/receipt-list']);
  }
}
