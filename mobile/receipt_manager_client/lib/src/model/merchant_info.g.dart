// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MerchantInfo extends MerchantInfo {
  @override
  final String? name;
  @override
  final String? taxId;
  @override
  final String? additionalInfo;

  factory _$MerchantInfo([void Function(MerchantInfoBuilder)? updates]) =>
      (MerchantInfoBuilder()..update(updates))._build();

  _$MerchantInfo._({this.name, this.taxId, this.additionalInfo}) : super._();
  @override
  MerchantInfo rebuild(void Function(MerchantInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MerchantInfoBuilder toBuilder() => MerchantInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MerchantInfo &&
        name == other.name &&
        taxId == other.taxId &&
        additionalInfo == other.additionalInfo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, taxId.hashCode);
    _$hash = $jc(_$hash, additionalInfo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MerchantInfo')
          ..add('name', name)
          ..add('taxId', taxId)
          ..add('additionalInfo', additionalInfo))
        .toString();
  }
}

class MerchantInfoBuilder
    implements Builder<MerchantInfo, MerchantInfoBuilder> {
  _$MerchantInfo? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _taxId;
  String? get taxId => _$this._taxId;
  set taxId(String? taxId) => _$this._taxId = taxId;

  String? _additionalInfo;
  String? get additionalInfo => _$this._additionalInfo;
  set additionalInfo(String? additionalInfo) =>
      _$this._additionalInfo = additionalInfo;

  MerchantInfoBuilder() {
    MerchantInfo._defaults(this);
  }

  MerchantInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _taxId = $v.taxId;
      _additionalInfo = $v.additionalInfo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MerchantInfo other) {
    _$v = other as _$MerchantInfo;
  }

  @override
  void update(void Function(MerchantInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MerchantInfo build() => _build();

  _$MerchantInfo _build() {
    final _$result = _$v ??
        _$MerchantInfo._(
          name: name,
          taxId: taxId,
          additionalInfo: additionalInfo,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
