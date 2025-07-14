// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaymentInfo extends PaymentInfo {
  @override
  final String? type;
  @override
  final String? terminalId;
  @override
  final String? transactionId;
  @override
  final String? slip;
  @override
  final String? bankCardType;

  factory _$PaymentInfo([void Function(PaymentInfoBuilder)? updates]) =>
      (PaymentInfoBuilder()..update(updates))._build();

  _$PaymentInfo._(
      {this.type,
      this.terminalId,
      this.transactionId,
      this.slip,
      this.bankCardType})
      : super._();
  @override
  PaymentInfo rebuild(void Function(PaymentInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentInfoBuilder toBuilder() => PaymentInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentInfo &&
        type == other.type &&
        terminalId == other.terminalId &&
        transactionId == other.transactionId &&
        slip == other.slip &&
        bankCardType == other.bankCardType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, terminalId.hashCode);
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, slip.hashCode);
    _$hash = $jc(_$hash, bankCardType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentInfo')
          ..add('type', type)
          ..add('terminalId', terminalId)
          ..add('transactionId', transactionId)
          ..add('slip', slip)
          ..add('bankCardType', bankCardType))
        .toString();
  }
}

class PaymentInfoBuilder implements Builder<PaymentInfo, PaymentInfoBuilder> {
  _$PaymentInfo? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _terminalId;
  String? get terminalId => _$this._terminalId;
  set terminalId(String? terminalId) => _$this._terminalId = terminalId;

  String? _transactionId;
  String? get transactionId => _$this._transactionId;
  set transactionId(String? transactionId) =>
      _$this._transactionId = transactionId;

  String? _slip;
  String? get slip => _$this._slip;
  set slip(String? slip) => _$this._slip = slip;

  String? _bankCardType;
  String? get bankCardType => _$this._bankCardType;
  set bankCardType(String? bankCardType) => _$this._bankCardType = bankCardType;

  PaymentInfoBuilder() {
    PaymentInfo._defaults(this);
  }

  PaymentInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _terminalId = $v.terminalId;
      _transactionId = $v.transactionId;
      _slip = $v.slip;
      _bankCardType = $v.bankCardType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentInfo other) {
    _$v = other as _$PaymentInfo;
  }

  @override
  void update(void Function(PaymentInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentInfo build() => _build();

  _$PaymentInfo _build() {
    final _$result = _$v ??
        _$PaymentInfo._(
          type: type,
          terminalId: terminalId,
          transactionId: transactionId,
          slip: slip,
          bankCardType: bankCardType,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
