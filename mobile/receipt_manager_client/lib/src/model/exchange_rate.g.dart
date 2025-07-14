// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExchangeRate extends ExchangeRate {
  @override
  final String? currency;
  @override
  final num? rate;
  @override
  final num? equivalentAmount;

  factory _$ExchangeRate([void Function(ExchangeRateBuilder)? updates]) =>
      (ExchangeRateBuilder()..update(updates))._build();

  _$ExchangeRate._({this.currency, this.rate, this.equivalentAmount})
      : super._();
  @override
  ExchangeRate rebuild(void Function(ExchangeRateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExchangeRateBuilder toBuilder() => ExchangeRateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExchangeRate &&
        currency == other.currency &&
        rate == other.rate &&
        equivalentAmount == other.equivalentAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, equivalentAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExchangeRate')
          ..add('currency', currency)
          ..add('rate', rate)
          ..add('equivalentAmount', equivalentAmount))
        .toString();
  }
}

class ExchangeRateBuilder
    implements Builder<ExchangeRate, ExchangeRateBuilder> {
  _$ExchangeRate? _$v;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  num? _rate;
  num? get rate => _$this._rate;
  set rate(num? rate) => _$this._rate = rate;

  num? _equivalentAmount;
  num? get equivalentAmount => _$this._equivalentAmount;
  set equivalentAmount(num? equivalentAmount) =>
      _$this._equivalentAmount = equivalentAmount;

  ExchangeRateBuilder() {
    ExchangeRate._defaults(this);
  }

  ExchangeRateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currency = $v.currency;
      _rate = $v.rate;
      _equivalentAmount = $v.equivalentAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExchangeRate other) {
    _$v = other as _$ExchangeRate;
  }

  @override
  void update(void Function(ExchangeRateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExchangeRate build() => _build();

  _$ExchangeRate _build() {
    final _$result = _$v ??
        _$ExchangeRate._(
          currency: currency,
          rate: rate,
          equivalentAmount: equivalentAmount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
