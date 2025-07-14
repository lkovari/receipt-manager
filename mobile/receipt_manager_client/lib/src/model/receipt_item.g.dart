// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReceiptItem extends ReceiptItem {
  @override
  final String description;
  @override
  final String? itemCode;
  @override
  final String? category;
  @override
  final num? unitPrice;
  @override
  final num quantity;
  @override
  final num lineTotal;
  @override
  final String currency;

  factory _$ReceiptItem([void Function(ReceiptItemBuilder)? updates]) =>
      (ReceiptItemBuilder()..update(updates))._build();

  _$ReceiptItem._(
      {required this.description,
      this.itemCode,
      this.category,
      this.unitPrice,
      required this.quantity,
      required this.lineTotal,
      required this.currency})
      : super._();
  @override
  ReceiptItem rebuild(void Function(ReceiptItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceiptItemBuilder toBuilder() => ReceiptItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceiptItem &&
        description == other.description &&
        itemCode == other.itemCode &&
        category == other.category &&
        unitPrice == other.unitPrice &&
        quantity == other.quantity &&
        lineTotal == other.lineTotal &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, itemCode.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, unitPrice.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, lineTotal.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceiptItem')
          ..add('description', description)
          ..add('itemCode', itemCode)
          ..add('category', category)
          ..add('unitPrice', unitPrice)
          ..add('quantity', quantity)
          ..add('lineTotal', lineTotal)
          ..add('currency', currency))
        .toString();
  }
}

class ReceiptItemBuilder implements Builder<ReceiptItem, ReceiptItemBuilder> {
  _$ReceiptItem? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _itemCode;
  String? get itemCode => _$this._itemCode;
  set itemCode(String? itemCode) => _$this._itemCode = itemCode;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  num? _unitPrice;
  num? get unitPrice => _$this._unitPrice;
  set unitPrice(num? unitPrice) => _$this._unitPrice = unitPrice;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  num? _lineTotal;
  num? get lineTotal => _$this._lineTotal;
  set lineTotal(num? lineTotal) => _$this._lineTotal = lineTotal;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  ReceiptItemBuilder() {
    ReceiptItem._defaults(this);
  }

  ReceiptItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _itemCode = $v.itemCode;
      _category = $v.category;
      _unitPrice = $v.unitPrice;
      _quantity = $v.quantity;
      _lineTotal = $v.lineTotal;
      _currency = $v.currency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceiptItem other) {
    _$v = other as _$ReceiptItem;
  }

  @override
  void update(void Function(ReceiptItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceiptItem build() => _build();

  _$ReceiptItem _build() {
    final _$result = _$v ??
        _$ReceiptItem._(
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'ReceiptItem', 'description'),
          itemCode: itemCode,
          category: category,
          unitPrice: unitPrice,
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'ReceiptItem', 'quantity'),
          lineTotal: BuiltValueNullFieldError.checkNotNull(
              lineTotal, r'ReceiptItem', 'lineTotal'),
          currency: BuiltValueNullFieldError.checkNotNull(
              currency, r'ReceiptItem', 'currency'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
