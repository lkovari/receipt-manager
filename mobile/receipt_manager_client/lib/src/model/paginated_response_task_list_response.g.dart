// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response_task_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedResponseTaskListResponse
    extends PaginatedResponseTaskListResponse {
  @override
  final BuiltList<TaskListResponse> items;
  @override
  final int total;
  @override
  final int limit;
  @override
  final int offset;
  @override
  final bool hasMore;

  factory _$PaginatedResponseTaskListResponse(
          [void Function(PaginatedResponseTaskListResponseBuilder)? updates]) =>
      (PaginatedResponseTaskListResponseBuilder()..update(updates))._build();

  _$PaginatedResponseTaskListResponse._(
      {required this.items,
      required this.total,
      required this.limit,
      required this.offset,
      required this.hasMore})
      : super._();
  @override
  PaginatedResponseTaskListResponse rebuild(
          void Function(PaginatedResponseTaskListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedResponseTaskListResponseBuilder toBuilder() =>
      PaginatedResponseTaskListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedResponseTaskListResponse &&
        items == other.items &&
        total == other.total &&
        limit == other.limit &&
        offset == other.offset &&
        hasMore == other.hasMore;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, hasMore.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginatedResponseTaskListResponse')
          ..add('items', items)
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset)
          ..add('hasMore', hasMore))
        .toString();
  }
}

class PaginatedResponseTaskListResponseBuilder
    implements
        Builder<PaginatedResponseTaskListResponse,
            PaginatedResponseTaskListResponseBuilder> {
  _$PaginatedResponseTaskListResponse? _$v;

  ListBuilder<TaskListResponse>? _items;
  ListBuilder<TaskListResponse> get items =>
      _$this._items ??= ListBuilder<TaskListResponse>();
  set items(ListBuilder<TaskListResponse>? items) => _$this._items = items;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  bool? _hasMore;
  bool? get hasMore => _$this._hasMore;
  set hasMore(bool? hasMore) => _$this._hasMore = hasMore;

  PaginatedResponseTaskListResponseBuilder() {
    PaginatedResponseTaskListResponse._defaults(this);
  }

  PaginatedResponseTaskListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _total = $v.total;
      _limit = $v.limit;
      _offset = $v.offset;
      _hasMore = $v.hasMore;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedResponseTaskListResponse other) {
    _$v = other as _$PaginatedResponseTaskListResponse;
  }

  @override
  void update(
      void Function(PaginatedResponseTaskListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedResponseTaskListResponse build() => _build();

  _$PaginatedResponseTaskListResponse _build() {
    _$PaginatedResponseTaskListResponse _$result;
    try {
      _$result = _$v ??
          _$PaginatedResponseTaskListResponse._(
            items: items.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PaginatedResponseTaskListResponse', 'total'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'PaginatedResponseTaskListResponse', 'limit'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'PaginatedResponseTaskListResponse', 'offset'),
            hasMore: BuiltValueNullFieldError.checkNotNull(
                hasMore, r'PaginatedResponseTaskListResponse', 'hasMore'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginatedResponseTaskListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
