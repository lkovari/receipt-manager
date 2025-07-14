// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_charge.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ServiceCharge extends ServiceCharge {
  @override
  final String? percentage;
  @override
  final num? amount;
  @override
  final String? currency;

  factory _$ServiceCharge([void Function(ServiceChargeBuilder)? updates]) =>
      (ServiceChargeBuilder()..update(updates))._build();

  _$ServiceCharge._({this.percentage, this.amount, this.currency}) : super._();
  @override
  ServiceCharge rebuild(void Function(ServiceChargeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceChargeBuilder toBuilder() => ServiceChargeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceCharge &&
        percentage == other.percentage &&
        amount == other.amount &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, percentage.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceCharge')
          ..add('percentage', percentage)
          ..add('amount', amount)
          ..add('currency', currency))
        .toString();
  }
}

class ServiceChargeBuilder
    implements Builder<ServiceCharge, ServiceChargeBuilder> {
  _$ServiceCharge? _$v;

  String? _percentage;
  String? get percentage => _$this._percentage;
  set percentage(String? percentage) => _$this._percentage = percentage;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  ServiceChargeBuilder() {
    ServiceCharge._defaults(this);
  }

  ServiceChargeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _percentage = $v.percentage;
      _amount = $v.amount;
      _currency = $v.currency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceCharge other) {
    _$v = other as _$ServiceCharge;
  }

  @override
  void update(void Function(ServiceChargeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceCharge build() => _build();

  _$ServiceCharge _build() {
    final _$result = _$v ??
        _$ServiceCharge._(
          percentage: percentage,
          amount: amount,
          currency: currency,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
