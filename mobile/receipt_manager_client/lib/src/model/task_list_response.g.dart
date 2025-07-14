// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskListResponse extends TaskListResponse {
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
  final BuiltMap<String, JsonObject?>? llmError;

  factory _$TaskListResponse(
          [void Function(TaskListResponseBuilder)? updates]) =>
      (TaskListResponseBuilder()..update(updates))._build();

  _$TaskListResponse._(
      {required this.id,
      required this.userId,
      required this.status,
      this.receiptId,
      this.errorMessage,
      required this.createdAt,
      required this.updatedAt,
      this.llmError})
      : super._();
  @override
  TaskListResponse rebuild(void Function(TaskListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskListResponseBuilder toBuilder() =>
      TaskListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskListResponse &&
        id == other.id &&
        userId == other.userId &&
        status == other.status &&
        receiptId == other.receiptId &&
        errorMessage == other.errorMessage &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        llmError == other.llmError;
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
    _$hash = $jc(_$hash, llmError.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaskListResponse')
          ..add('id', id)
          ..add('userId', userId)
          ..add('status', status)
          ..add('receiptId', receiptId)
          ..add('errorMessage', errorMessage)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('llmError', llmError))
        .toString();
  }
}

class TaskListResponseBuilder
    implements Builder<TaskListResponse, TaskListResponseBuilder> {
  _$TaskListResponse? _$v;

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

  MapBuilder<String, JsonObject?>? _llmError;
  MapBuilder<String, JsonObject?> get llmError =>
      _$this._llmError ??= MapBuilder<String, JsonObject?>();
  set llmError(MapBuilder<String, JsonObject?>? llmError) =>
      _$this._llmError = llmError;

  TaskListResponseBuilder() {
    TaskListResponse._defaults(this);
  }

  TaskListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _status = $v.status;
      _receiptId = $v.receiptId;
      _errorMessage = $v.errorMessage;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _llmError = $v.llmError?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskListResponse other) {
    _$v = other as _$TaskListResponse;
  }

  @override
  void update(void Function(TaskListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaskListResponse build() => _build();

  _$TaskListResponse _build() {
    _$TaskListResponse _$result;
    try {
      _$result = _$v ??
          _$TaskListResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'TaskListResponse', 'id'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'TaskListResponse', 'userId'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'TaskListResponse', 'status'),
            receiptId: receiptId,
            errorMessage: errorMessage,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'TaskListResponse', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'TaskListResponse', 'updatedAt'),
            llmError: _llmError?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'llmError';
        _llmError?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TaskListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
