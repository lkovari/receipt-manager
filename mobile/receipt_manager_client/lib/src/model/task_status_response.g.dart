// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskStatusResponse extends TaskStatusResponse {
  @override
  final String id;
  @override
  final String userId;
  @override
  final ProcessingStatus status;
  @override
  final String? receiptId;
  @override
  final String? errorMessage;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? imageUrl;
  @override
  final String? exceptionDetails;

  factory _$TaskStatusResponse(
          [void Function(TaskStatusResponseBuilder)? updates]) =>
      (TaskStatusResponseBuilder()..update(updates))._build();

  _$TaskStatusResponse._(
      {required this.id,
      required this.userId,
      required this.status,
      this.receiptId,
      this.errorMessage,
      required this.createdAt,
      required this.updatedAt,
      this.imageUrl,
      this.exceptionDetails})
      : super._();
  @override
  TaskStatusResponse rebuild(
          void Function(TaskStatusResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskStatusResponseBuilder toBuilder() =>
      TaskStatusResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskStatusResponse &&
        id == other.id &&
        userId == other.userId &&
        status == other.status &&
        receiptId == other.receiptId &&
        errorMessage == other.errorMessage &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        imageUrl == other.imageUrl &&
        exceptionDetails == other.exceptionDetails;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, receiptId.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, exceptionDetails.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskStatusResponse')
          ..add('id', id)
          ..add('userId', userId)
          ..add('status', status)
          ..add('receiptId', receiptId)
          ..add('errorMessage', errorMessage)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('imageUrl', imageUrl)
          ..add('exceptionDetails', exceptionDetails))
        .toString();
  }
}

class TaskStatusResponseBuilder
    implements Builder<TaskStatusResponse, TaskStatusResponseBuilder> {
  _$TaskStatusResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ProcessingStatus? _status;
  ProcessingStatus? get status => _$this._status;
  set status(ProcessingStatus? status) => _$this._status = status;

  String? _receiptId;
  String? get receiptId => _$this._receiptId;
  set receiptId(String? receiptId) => _$this._receiptId = receiptId;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _exceptionDetails;
  String? get exceptionDetails => _$this._exceptionDetails;
  set exceptionDetails(String? exceptionDetails) =>
      _$this._exceptionDetails = exceptionDetails;

  TaskStatusResponseBuilder() {
    TaskStatusResponse._defaults(this);
  }

  TaskStatusResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _status = $v.status;
      _receiptId = $v.receiptId;
      _errorMessage = $v.errorMessage;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _imageUrl = $v.imageUrl;
      _exceptionDetails = $v.exceptionDetails;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskStatusResponse other) {
    _$v = other as _$TaskStatusResponse;
  }

  @override
  void update(void Function(TaskStatusResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskStatusResponse build() => _build();

  _$TaskStatusResponse _build() {
    final _$result = _$v ??
        _$TaskStatusResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'TaskStatusResponse', 'id'),
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'TaskStatusResponse', 'userId'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'TaskStatusResponse', 'status'),
          receiptId: receiptId,
          errorMessage: errorMessage,
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'TaskStatusResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'TaskStatusResponse', 'updatedAt'),
          imageUrl: imageUrl,
          exceptionDetails: exceptionDetails,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
