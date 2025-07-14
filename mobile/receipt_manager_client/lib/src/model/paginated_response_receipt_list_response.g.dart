// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response_receipt_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedResponseReceiptListResponse
    extends PaginatedResponseReceiptListResponse {
  @override
  final BuiltList<ReceiptListResponse> items;
  @override
  final int total;
  @override
  final int limit;
  @override
  final int offset;
  @override
  final bool hasMore;

  factory _$PaginatedResponseReceiptListResponse(
          [void Function(PaginatedResponseReceiptListResponseBuilder)?
              updates]) =>
      (PaginatedResponseReceiptListResponseBuilder()..update(updates))._build();

  _$PaginatedResponseReceiptListResponse._(
      {required this.items,
      required this.total,
      required this.limit,
      required this.offset,
      required this.hasMore})
      : super._();
  @override
  PaginatedResponseReceiptListResponse rebuild(
          void Function(PaginatedResponseReceiptListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedResponseReceiptListResponseBuilder toBuilder() =>
      PaginatedResponseReceiptListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedResponseReceiptListResponse &&
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
    return (newBuiltValueToStringHelper(r'PaginatedResponseReceiptListResponse')
          ..add('items', items)
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset)
          ..add('hasMore', hasMore))
        .toString();
  }
}

class PaginatedResponseReceiptListResponseBuilder
    implements
        Builder<PaginatedResponseReceiptListResponse,
            PaginatedResponseReceiptListResponseBuilder> {
  _$PaginatedResponseReceiptListResponse? _$v;

  ListBuilder<ReceiptListResponse>? _items;
  ListBuilder<ReceiptListResponse> get items =>
      _$this._items ??= ListBuilder<ReceiptListResponse>();
  set items(ListBuilder<ReceiptListResponse>? items) => _$this._items = items;

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

  PaginatedResponseReceiptListResponseBuilder() {
    PaginatedResponseReceiptListResponse._defaults(this);
  }

  PaginatedResponseReceiptListResponseBuilder get _$this {
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
  void replace(PaginatedResponseReceiptListResponse other) {
    _$v = other as _$PaginatedResponseReceiptListResponse;
  }

  @override
  void update(
      void Function(PaginatedResponseReceiptListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedResponseReceiptListResponse build() => _build();

  _$PaginatedResponseReceiptListResponse _build() {
    _$PaginatedResponseReceiptListResponse _$result;
    try {
      _$result = _$v ??
          _$PaginatedResponseReceiptListResponse._(
            items: items.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PaginatedResponseReceiptListResponse', 'total'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'PaginatedResponseReceiptListResponse', 'limit'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'PaginatedResponseReceiptListResponse', 'offset'),
            hasMore: BuiltValueNullFieldError.checkNotNull(
                hasMore, r'PaginatedResponseReceiptListResponse', 'hasMore'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginatedResponseReceiptListResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
