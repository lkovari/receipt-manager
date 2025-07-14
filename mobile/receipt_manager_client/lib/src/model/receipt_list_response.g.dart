// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReceiptListResponse extends ReceiptListResponse {
  @override
  final String id;
  @override
  final String userId;
  @override
  final String? merchant;
  @override
  final num total;
  @override
  final String? currency;
  @override
  final Date? date;
  @override
  final String? imageUrl;
  @override
  final DateTime createdAt;

  factory _$ReceiptListResponse(
          [void Function(ReceiptListResponseBuilder)? updates]) =>
      (ReceiptListResponseBuilder()..update(updates))._build();

  _$ReceiptListResponse._(
      {required this.id,
      required this.userId,
      this.merchant,
      required this.total,
      this.currency,
      this.date,
      this.imageUrl,
      required this.createdAt})
      : super._();
  @override
  ReceiptListResponse rebuild(
          void Function(ReceiptListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceiptListResponseBuilder toBuilder() =>
      ReceiptListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceiptListResponse &&
        id == other.id &&
        userId == other.userId &&
        merchant == other.merchant &&
        total == other.total &&
        currency == other.currency &&
        date == other.date &&
        imageUrl == other.imageUrl &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, merchant.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceiptListResponse')
          ..add('id', id)
          ..add('userId', userId)
          ..add('merchant', merchant)
          ..add('total', total)
          ..add('currency', currency)
          ..add('date', date)
          ..add('imageUrl', imageUrl)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ReceiptListResponseBuilder
    implements Builder<ReceiptListResponse, ReceiptListResponseBuilder> {
  _$ReceiptListResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _merchant;
  String? get merchant => _$this._merchant;
  set merchant(String? merchant) => _$this._merchant = merchant;

  num? _total;
  num? get total => _$this._total;
  set total(num? total) => _$this._total = total;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  Date? _date;
  Date? get date => _$this._date;
  set date(Date? date) => _$this._date = date;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ReceiptListResponseBuilder() {
    ReceiptListResponse._defaults(this);
  }

  ReceiptListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _merchant = $v.merchant;
      _total = $v.total;
      _currency = $v.currency;
      _date = $v.date;
      _imageUrl = $v.imageUrl;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceiptListResponse other) {
    _$v = other as _$ReceiptListResponse;
  }

  @override
  void update(void Function(ReceiptListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceiptListResponse build() => _build();

  _$ReceiptListResponse _build() {
    final _$result = _$v ??
        _$ReceiptListResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ReceiptListResponse', 'id'),
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'ReceiptListResponse', 'userId'),
          merchant: merchant,
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'ReceiptListResponse', 'total'),
          currency: currency,
          date: date,
          imageUrl: imageUrl,
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'ReceiptListResponse', 'createdAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
