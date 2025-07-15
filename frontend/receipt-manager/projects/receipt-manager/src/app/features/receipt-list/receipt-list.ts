import { Component, inject, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { PaginatedResponseReceiptListResponse } from '../../core/model/paginatedResponseReceiptListResponse';
import { CommonModule } from '@angular/common';
import { ReceiptListResponse } from '../../core';
import { ShowTooltipDirective } from '../../shared';

@Component({
  selector: 'app-receipt-list',
  imports: [CommonModule, ShowTooltipDirective],
  templateUrl: './receipt-list.html',
  styleUrl: './receipt-list.scss'
})
export class ReceiptListComponent {
  private route = inject(ActivatedRoute);
  private router = inject(Router);

  receipts: PaginatedResponseReceiptListResponse | null = this.route.snapshot.data['receipts'] ?? null;
  receiptList: ReceiptListResponse[] = this.receipts ? this.receipts.items : [];
  selectedReceipt: ReceiptListResponse | null = null;

  trackByIdFn(index: number, item: ReceiptListResponse): string {
    return item.id;
  }

  onRowClick(receipt: ReceiptListResponse) {
    this.selectedReceipt = receipt;
    console.log('Selected receipt:', receipt);
    this.router.navigate(['/receipt-details', receipt.id], { state: { receipt } });
  }

  isSelected(receipt: ReceiptListResponse): boolean {
    return this.selectedReceipt?.id === receipt.id;
  }
}
