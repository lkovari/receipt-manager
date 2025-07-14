import { inject, Injectable } from '@angular/core';
import { ResolveFn } from '@angular/router';
import { ReceiptsService } from '../../core/api/receipts.service';
import { PaginatedResponseReceiptListResponse } from '../../core/model/paginatedResponseReceiptListResponse';

export const ReceiptListResolver: ResolveFn<PaginatedResponseReceiptListResponse> = () => {
  const receiptsService = inject(ReceiptsService);
  return receiptsService.listUserReceiptsReceiptsGet();
}; 