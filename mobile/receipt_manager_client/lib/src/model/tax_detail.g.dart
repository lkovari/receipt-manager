// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaxDetail extends TaxDetail {
  @override
  final String? rate;
  @override
  final num? taxableAmount;
  @override
  final num? taxAmount;
  @override
  final num? totalWithTax;
  @override
  final String currency;

  factory _$TaxDetail([void Function(TaxDetailBuilder)? updates]) =>
      (TaxDetailBuilder()..update(updates))._build();

  _$TaxDetail._(
      {this.rate,
      this.taxableAmount,
      this.taxAmount,
      this.totalWithTax,
      required this.currency})
      : super._();
  @override
  TaxDetail rebuild(void Function(TaxDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaxDetailBuilder toBuilder() => TaxDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaxDetail &&
        rate == other.rate &&
        taxableAmount == other.taxableAmount &&
        taxAmount == other.taxAmount &&
        totalWithTax == other.totalWithTax &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, taxableAmount.hashCode);
    _$hash = $jc(_$hash, taxAmount.hashCode);
    _$hash = $jc(_$hash, totalWithTax.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaxDetail')
          ..add('rate', rate)
          ..add('taxableAmount', taxableAmount)
          ..add('taxAmount', taxAmount)
          ..add('totalWithTax', totalWithTax)
          ..add('currency', currency))
        .toString();
  }
}

class TaxDetailBuilder implements Builder<TaxDetail, TaxDetailBuilder> {
  _$TaxDetail? _$v;

  String? _rate;
  String? get rate => _$this._rate;
  set rate(String? rate) => _$this._rate = rate;

  num? _taxableAmount;
  num? get taxableAmount => _$this._taxableAmount;
  set taxableAmount(num? taxableAmount) =>
      _$this._taxableAmount = taxableAmount;

  num? _taxAmount;
  num? get taxAmount => _$this._taxAmount;
  set taxAmount(num? taxAmount) => _$this._taxAmount = taxAmount;

  num? _totalWithTax;
  num? get totalWithTax => _$this._totalWithTax;
  set totalWithTax(num? totalWithTax) => _$this._totalWithTax = totalWithTax;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  TaxDetailBuilder() {
    TaxDetail._defaults(this);
  }

  TaxDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rate = $v.rate;
      _taxableAmount = $v.taxableAmount;
      _taxAmount = $v.taxAmount;
      _totalWithTax = $v.totalWithTax;
      _currency = $v.currency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaxDetail other) {
    _$v = other as _$TaxDetail;
  }

  @override
  void update(void Function(TaxDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaxDetail build() => _build();

  _$TaxDetail _build() {
    final _$result = _$v ??
        _$TaxDetail._(
          rate: rate,
          taxableAmount: taxableAmount,
          taxAmount: taxAmount,
          totalWithTax: totalWithTax,
          currency: BuiltValueNullFieldError.checkNotNull(
              currency, r'TaxDetail', 'currency'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
