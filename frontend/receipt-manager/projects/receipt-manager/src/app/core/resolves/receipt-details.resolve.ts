import { ResolveFn } from '@angular/router';
import { inject } from '@angular/core';
import { ReceiptsService } from '../../core/api/receipts.service';

export const ReceiptDetailsResolver: ResolveFn<any> = (route) => {
  const receiptsService = inject(ReceiptsService);
  const id = route.paramMap.get('id');
  
  return receiptsService.getReceiptByIdReceiptsReceiptIdGet(id!);
};