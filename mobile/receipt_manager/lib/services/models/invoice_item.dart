
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'invoice_item.freezed.dart';
part 'invoice_item.g.dart';

@freezed
abstract class InvoiceItem with _$InvoiceItem {
  const factory InvoiceItem({
    required String name,
    required num price,
  }) = _InvoiceItem;

  factory InvoiceItem.fromJson(Map<String, Object?> json) => _$InvoiceItemFromJson(json);
}