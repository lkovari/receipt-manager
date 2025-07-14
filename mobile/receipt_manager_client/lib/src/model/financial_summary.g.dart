// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_summary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FinancialSummary extends FinancialSummary {
  @override
  final num? subtotal;
  @override
  final num? taxAmount;
  @override
  final num finalTotal;
  @override
  final String currency;

  factory _$FinancialSummary(
          [void Function(FinancialSummaryBuilder)? updates]) =>
      (FinancialSummaryBuilder()..update(updates))._build();

  _$FinancialSummary._(
      {this.subtotal,
      this.taxAmount,
      required this.finalTotal,
      required this.currency})
      : super._();
  @override
  FinancialSummary rebuild(void Function(FinancialSummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FinancialSummaryBuilder toBuilder() =>
      FinancialSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FinancialSummary &&
        subtotal == other.subtotal &&
        taxAmount == other.taxAmount &&
        finalTotal == other.finalTotal &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, subtotal.hashCode);
    _$hash = $jc(_$hash, taxAmount.hashCode);
    _$hash = $jc(_$hash, finalTotal.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FinancialSummary')
          ..add('subtotal', subtotal)
          ..add('taxAmount', taxAmount)
          ..add('finalTotal', finalTotal)
          ..add('currency', currency))
        .toString();
  }
}

class FinancialSummaryBuilder
    implements Builder<FinancialSummary, FinancialSummaryBuilder> {
  _$FinancialSummary? _$v;

  num? _subtotal;
  num? get subtotal => _$this._subtotal;
  set subtotal(num? subtotal) => _$this._subtotal = subtotal;

  num? _taxAmount;
  num? get taxAmount => _$this._taxAmount;
  set taxAmount(num? taxAmount) => _$this._taxAmount = taxAmount;

  num? _finalTotal;
  num? get finalTotal => _$this._finalTotal;
  set finalTotal(num? finalTotal) => _$this._finalTotal = finalTotal;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  FinancialSummaryBuilder() {
    FinancialSummary._defaults(this);
  }

  FinancialSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subtotal = $v.subtotal;
      _taxAmount = $v.taxAmount;
      _finalTotal = $v.finalTotal;
      _currency = $v.currency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FinancialSummary other) {
    _$v = other as _$FinancialSummary;
  }

  @override
  void update(void Function(FinancialSummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FinancialSummary build() => _build();

  _$FinancialSummary _build() {
    final _$result = _$v ??
        _$FinancialSummary._(
          subtotal: subtotal,
          taxAmount: taxAmount,
          finalTotal: BuiltValueNullFieldError.checkNotNull(
              finalTotal, r'FinancialSummary', 'finalTotal'),
          currency: BuiltValueNullFieldError.checkNotNull(
              currency, r'FinancialSummary', 'currency'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
