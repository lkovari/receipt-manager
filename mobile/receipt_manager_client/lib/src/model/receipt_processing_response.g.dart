// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_processing_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReceiptProcessingResponse extends ReceiptProcessingResponse {
  @override
  final String taskId;
  @override
  final ProcessingStatus status;
  @override
  final String message;

  factory _$ReceiptProcessingResponse(
          [void Function(ReceiptProcessingResponseBuilder)? updates]) =>
      (ReceiptProcessingResponseBuilder()..update(updates))._build();

  _$ReceiptProcessingResponse._(
      {required this.taskId, required this.status, required this.message})
      : super._();
  @override
  ReceiptProcessingResponse rebuild(
          void Function(ReceiptProcessingResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceiptProcessingResponseBuilder toBuilder() =>
      ReceiptProcessingResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceiptProcessingResponse &&
        taskId == other.taskId &&
        status == other.status &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, taskId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceiptProcessingResponse')
          ..add('taskId', taskId)
          ..add('status', status)
          ..add('message', message))
        .toString();
  }
}

class ReceiptProcessingResponseBuilder
    implements
        Builder<ReceiptProcessingResponse, ReceiptProcessingResponseBuilder> {
  _$ReceiptProcessingResponse? _$v;

  String? _taskId;
  String? get taskId => _$this._taskId;
  set taskId(String? taskId) => _$this._taskId = taskId;

  ProcessingStatus? _status;
  ProcessingStatus? get status => _$this._status;
  set status(ProcessingStatus? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ReceiptProcessingResponseBuilder() {
    ReceiptProcessingResponse._defaults(this);
  }

  ReceiptProcessingResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _taskId = $v.taskId;
      _status = $v.status;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceiptProcessingResponse other) {
    _$v = other as _$ReceiptProcessingResponse;
  }

  @override
  void update(void Function(ReceiptProcessingResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceiptProcessingResponse build() => _build();

  _$ReceiptProcessingResponse _build() {
    final _$result = _$v ??
        _$ReceiptProcessingResponse._(
          taskId: BuiltValueNullFieldError.checkNotNull(
              taskId, r'ReceiptProcessingResponse', 'taskId'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ReceiptProcessingResponse', 'status'),
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'ReceiptProcessingResponse', 'message'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
