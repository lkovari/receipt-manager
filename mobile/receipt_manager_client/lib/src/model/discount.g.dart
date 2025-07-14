// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Discount extends Discount {
  @override
  final String description;
  @override
  final num amount;
  @override
  final String currency;

  factory _$Discount([void Function(DiscountBuilder)? updates]) =>
      (DiscountBuilder()..update(updates))._build();

  _$Discount._(
      {required this.description, required this.amount, required this.currency})
      : super._();
  @override
  Discount rebuild(void Function(DiscountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiscountBuilder toBuilder() => DiscountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Discount &&
        description == other.description &&
        amount == other.amount &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Discount')
          ..add('description', description)
          ..add('amount', amount)
          ..add('currency', currency))
        .toString();
  }
}

class DiscountBuilder implements Builder<Discount, DiscountBuilder> {
  _$Discount? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  DiscountBuilder() {
    Discount._defaults(this);
  }

  DiscountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _amount = $v.amount;
      _currency = $v.currency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Discount other) {
    _$v = other as _$Discount;
  }

  @override
  void update(void Function(DiscountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Discount build() => _build();

  _$Discount _build() {
    final _$result = _$v ??
        _$Discount._(
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'Discount', 'description'),
          amount: BuiltValueNullFieldError.checkNotNull(
              amount, r'Discount', 'amount'),
          currency: BuiltValueNullFieldError.checkNotNull(
              currency, r'Discount', 'currency'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
