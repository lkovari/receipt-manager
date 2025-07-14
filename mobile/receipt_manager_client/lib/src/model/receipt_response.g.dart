// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReceiptResponse extends ReceiptResponse {
  @override
  final String id;
  @override
  final String userId;
  @override
  final ReceiptData receiptData;
  @override
  final String? merchant;
  @override
  final num total;
  @override
  final Date? date;
  @override
  final String? imageUrl;
  @override
  final DateTime createdAt;

  factory _$ReceiptResponse([void Function(ReceiptResponseBuilder)? updates]) =>
      (ReceiptResponseBuilder()..update(updates))._build();

  _$ReceiptResponse._(
      {required this.id,
      required this.userId,
      required this.receiptData,
      this.merchant,
      required this.total,
      this.date,
      this.imageUrl,
      required this.createdAt})
      : super._();
  @override
  ReceiptResponse rebuild(void Function(ReceiptResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceiptResponseBuilder toBuilder() => ReceiptResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceiptResponse &&
        id == other.id &&
        userId == other.userId &&
        receiptData == other.receiptData &&
        merchant == other.merchant &&
        total == other.total &&
        date == other.date &&
        imageUrl == other.imageUrl &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, receiptData.hashCode);
    _$hash = $jc(_$hash, merchant.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceiptResponse')
          ..add('id', id)
          ..add('userId', userId)
          ..add('receiptData', receiptData)
          ..add('merchant', merchant)
          ..add('total', total)
          ..add('date', date)
          ..add('imageUrl', imageUrl)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ReceiptResponseBuilder
    implements Builder<ReceiptResponse, ReceiptResponseBuilder> {
  _$ReceiptResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ReceiptDataBuilder? _receiptData;
  ReceiptDataBuilder get receiptData =>
      _$this._receiptData ??= ReceiptDataBuilder();
  set receiptData(ReceiptDataBuilder? receiptData) =>
      _$this._receiptData = receiptData;

  String? _merchant;
  String? get merchant => _$this._merchant;
  set merchant(String? merchant) => _$this._merchant = merchant;

  num? _total;
  num? get total => _$this._total;
  set total(num? total) => _$this._total = total;

  Date? _date;
  Date? get date => _$this._date;
  set date(Date? date) => _$this._date = date;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ReceiptResponseBuilder() {
    ReceiptResponse._defaults(this);
  }

  ReceiptResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _receiptData = $v.receiptData.toBuilder();
      _merchant = $v.merchant;
      _total = $v.total;
      _date = $v.date;
      _imageUrl = $v.imageUrl;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceiptResponse other) {
    _$v = other as _$ReceiptResponse;
  }

  @override
  void update(void Function(ReceiptResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceiptResponse build() => _build();

  _$ReceiptResponse _build() {
    _$ReceiptResponse _$result;
    try {
      _$result = _$v ??
          _$ReceiptResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ReceiptResponse', 'id'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'ReceiptResponse', 'userId'),
            receiptData: receiptData.build(),
            merchant: merchant,
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'ReceiptResponse', 'total'),
            date: date,
            imageUrl: imageUrl,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ReceiptResponse', 'createdAt'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'receiptData';
        receiptData.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReceiptResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
