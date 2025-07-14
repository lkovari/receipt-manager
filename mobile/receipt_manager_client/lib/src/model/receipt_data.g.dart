// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReceiptData extends ReceiptData {
  @override
  final bool isValid;
  @override
  final MerchantInfo merchantInfo;
  @override
  final Location location;
  @override
  final String? dateTime;
  @override
  final BuiltList<ReceiptItem> items;
  @override
  final FinancialSummary financialSummary;
  @override
  final BuiltList<TaxDetail>? taxDetails;
  @override
  final BuiltList<Discount>? discounts;
  @override
  final ServiceCharge? serviceCharge;
  @override
  final PaymentInfo paymentInfo;
  @override
  final ExchangeRate? exchangeRate;
  @override
  final BuiltList<String>? notes;
  @override
  final BuiltList<String>? handwrittenNotes;

  factory _$ReceiptData([void Function(ReceiptDataBuilder)? updates]) =>
      (ReceiptDataBuilder()..update(updates))._build();

  _$ReceiptData._(
      {required this.isValid,
      required this.merchantInfo,
      required this.location,
      this.dateTime,
      required this.items,
      required this.financialSummary,
      this.taxDetails,
      this.discounts,
      this.serviceCharge,
      required this.paymentInfo,
      this.exchangeRate,
      this.notes,
      this.handwrittenNotes})
      : super._();
  @override
  ReceiptData rebuild(void Function(ReceiptDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceiptDataBuilder toBuilder() => ReceiptDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceiptData &&
        isValid == other.isValid &&
        merchantInfo == other.merchantInfo &&
        location == other.location &&
        dateTime == other.dateTime &&
        items == other.items &&
        financialSummary == other.financialSummary &&
        taxDetails == other.taxDetails &&
        discounts == other.discounts &&
        serviceCharge == other.serviceCharge &&
        paymentInfo == other.paymentInfo &&
        exchangeRate == other.exchangeRate &&
        notes == other.notes &&
        handwrittenNotes == other.handwrittenNotes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isValid.hashCode);
    _$hash = $jc(_$hash, merchantInfo.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, dateTime.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, financialSummary.hashCode);
    _$hash = $jc(_$hash, taxDetails.hashCode);
    _$hash = $jc(_$hash, discounts.hashCode);
    _$hash = $jc(_$hash, serviceCharge.hashCode);
    _$hash = $jc(_$hash, paymentInfo.hashCode);
    _$hash = $jc(_$hash, exchangeRate.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, handwrittenNotes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceiptData')
          ..add('isValid', isValid)
          ..add('merchantInfo', merchantInfo)
          ..add('location', location)
          ..add('dateTime', dateTime)
          ..add('items', items)
          ..add('financialSummary', financialSummary)
          ..add('taxDetails', taxDetails)
          ..add('discounts', discounts)
          ..add('serviceCharge', serviceCharge)
          ..add('paymentInfo', paymentInfo)
          ..add('exchangeRate', exchangeRate)
          ..add('notes', notes)
          ..add('handwrittenNotes', handwrittenNotes))
        .toString();
  }
}

class ReceiptDataBuilder implements Builder<ReceiptData, ReceiptDataBuilder> {
  _$ReceiptData? _$v;

  bool? _isValid;
  bool? get isValid => _$this._isValid;
  set isValid(bool? isValid) => _$this._isValid = isValid;

  MerchantInfoBuilder? _merchantInfo;
  MerchantInfoBuilder get merchantInfo =>
      _$this._merchantInfo ??= MerchantInfoBuilder();
  set merchantInfo(MerchantInfoBuilder? merchantInfo) =>
      _$this._merchantInfo = merchantInfo;

  LocationBuilder? _location;
  LocationBuilder get location => _$this._location ??= LocationBuilder();
  set location(LocationBuilder? location) => _$this._location = location;

  String? _dateTime;
  String? get dateTime => _$this._dateTime;
  set dateTime(String? dateTime) => _$this._dateTime = dateTime;

  ListBuilder<ReceiptItem>? _items;
  ListBuilder<ReceiptItem> get items =>
      _$this._items ??= ListBuilder<ReceiptItem>();
  set items(ListBuilder<ReceiptItem>? items) => _$this._items = items;

  FinancialSummaryBuilder? _financialSummary;
  FinancialSummaryBuilder get financialSummary =>
      _$this._financialSummary ??= FinancialSummaryBuilder();
  set financialSummary(FinancialSummaryBuilder? financialSummary) =>
      _$this._financialSummary = financialSummary;

  ListBuilder<TaxDetail>? _taxDetails;
  ListBuilder<TaxDetail> get taxDetails =>
      _$this._taxDetails ??= ListBuilder<TaxDetail>();
  set taxDetails(ListBuilder<TaxDetail>? taxDetails) =>
      _$this._taxDetails = taxDetails;

  ListBuilder<Discount>? _discounts;
  ListBuilder<Discount> get discounts =>
      _$this._discounts ??= ListBuilder<Discount>();
  set discounts(ListBuilder<Discount>? discounts) =>
      _$this._discounts = discounts;

  ServiceChargeBuilder? _serviceCharge;
  ServiceChargeBuilder get serviceCharge =>
      _$this._serviceCharge ??= ServiceChargeBuilder();
  set serviceCharge(ServiceChargeBuilder? serviceCharge) =>
      _$this._serviceCharge = serviceCharge;

  PaymentInfoBuilder? _paymentInfo;
  PaymentInfoBuilder get paymentInfo =>
      _$this._paymentInfo ??= PaymentInfoBuilder();
  set paymentInfo(PaymentInfoBuilder? paymentInfo) =>
      _$this._paymentInfo = paymentInfo;

  ExchangeRateBuilder? _exchangeRate;
  ExchangeRateBuilder get exchangeRate =>
      _$this._exchangeRate ??= ExchangeRateBuilder();
  set exchangeRate(ExchangeRateBuilder? exchangeRate) =>
      _$this._exchangeRate = exchangeRate;

  ListBuilder<String>? _notes;
  ListBuilder<String> get notes => _$this._notes ??= ListBuilder<String>();
  set notes(ListBuilder<String>? notes) => _$this._notes = notes;

  ListBuilder<String>? _handwrittenNotes;
  ListBuilder<String> get handwrittenNotes =>
      _$this._handwrittenNotes ??= ListBuilder<String>();
  set handwrittenNotes(ListBuilder<String>? handwrittenNotes) =>
      _$this._handwrittenNotes = handwrittenNotes;

  ReceiptDataBuilder() {
    ReceiptData._defaults(this);
  }

  ReceiptDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isValid = $v.isValid;
      _merchantInfo = $v.merchantInfo.toBuilder();
      _location = $v.location.toBuilder();
      _dateTime = $v.dateTime;
      _items = $v.items.toBuilder();
      _financialSummary = $v.financialSummary.toBuilder();
      _taxDetails = $v.taxDetails?.toBuilder();
      _discounts = $v.discounts?.toBuilder();
      _serviceCharge = $v.serviceCharge?.toBuilder();
      _paymentInfo = $v.paymentInfo.toBuilder();
      _exchangeRate = $v.exchangeRate?.toBuilder();
      _notes = $v.notes?.toBuilder();
      _handwrittenNotes = $v.handwrittenNotes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceiptData other) {
    _$v = other as _$ReceiptData;
  }

  @override
  void update(void Function(ReceiptDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceiptData build() => _build();

  _$ReceiptData _build() {
    _$ReceiptData _$result;
    try {
      _$result = _$v ??
          _$ReceiptData._(
            isValid: BuiltValueNullFieldError.checkNotNull(
                isValid, r'ReceiptData', 'isValid'),
            merchantInfo: merchantInfo.build(),
            location: location.build(),
            dateTime: dateTime,
            items: items.build(),
            financialSummary: financialSummary.build(),
            taxDetails: _taxDetails?.build(),
            discounts: _discounts?.build(),
            serviceCharge: _serviceCharge?.build(),
            paymentInfo: paymentInfo.build(),
            exchangeRate: _exchangeRate?.build(),
            notes: _notes?.build(),
            handwrittenNotes: _handwrittenNotes?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'merchantInfo';
        merchantInfo.build();
        _$failedField = 'location';
        location.build();

        _$failedField = 'items';
        items.build();
        _$failedField = 'financialSummary';
        financialSummary.build();
        _$failedField = 'taxDetails';
        _taxDetails?.build();
        _$failedField = 'discounts';
        _discounts?.build();
        _$failedField = 'serviceCharge';
        _serviceCharge?.build();
        _$failedField = 'paymentInfo';
        paymentInfo.build();
        _$failedField = 'exchangeRate';
        _exchangeRate?.build();
        _$failedField = 'notes';
        _notes?.build();
        _$failedField = 'handwrittenNotes';
        _handwrittenNotes?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReceiptData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
