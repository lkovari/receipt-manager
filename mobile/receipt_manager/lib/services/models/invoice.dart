
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:receipt_manager/services/models/invoice_item.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
abstract class Invoice with _$Invoice {
  const factory Invoice({
    required String id,
    required List<InvoiceItem> items,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, Object?> json) => _$InvoiceFromJson(json);
}