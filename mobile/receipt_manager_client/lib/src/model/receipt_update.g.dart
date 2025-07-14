// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_update.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReceiptUpdate extends ReceiptUpdate {
  @override
  final ReceiptData? receiptData;
  @override
  final String? imageUrl;

  factory _$ReceiptUpdate([void Function(ReceiptUpdateBuilder)? updates]) =>
      (ReceiptUpdateBuilder()..update(updates))._build();

  _$ReceiptUpdate._({this.receiptData, this.imageUrl}) : super._();
  @override
  ReceiptUpdate rebuild(void Function(ReceiptUpdateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceiptUpdateBuilder toBuilder() => ReceiptUpdateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceiptUpdate &&
        receiptData == other.receiptData &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, receiptData.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceiptUpdate')
          ..add('receiptData', receiptData)
          ..add('imageUrl', imageUrl))
        .toString();
  }
}

class ReceiptUpdateBuilder
    implements Builder<ReceiptUpdate, ReceiptUpdateBuilder> {
  _$ReceiptUpdate? _$v;

  ReceiptDataBuilder? _receiptData;
  ReceiptDataBuilder get receiptData =>
      _$this._receiptData ??= ReceiptDataBuilder();
  set receiptData(ReceiptDataBuilder? receiptData) =>
      _$this._receiptData = receiptData;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  ReceiptUpdateBuilder() {
    ReceiptUpdate._defaults(this);
  }

  ReceiptUpdateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _receiptData = $v.receiptData?.toBuilder();
      _imageUrl = $v.imageUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceiptUpdate other) {
    _$v = other as _$ReceiptUpdate;
  }

  @override
  void update(void Function(ReceiptUpdateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceiptUpdate build() => _build();

  _$ReceiptUpdate _build() {
    _$ReceiptUpdate _$result;
    try {
      _$result = _$v ??
          _$ReceiptUpdate._(
            receiptData: _receiptData?.build(),
            imageUrl: imageUrl,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'receiptData';
        _receiptData?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReceiptUpdate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
