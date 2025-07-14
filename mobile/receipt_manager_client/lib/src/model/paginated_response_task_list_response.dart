//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/task_list_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_response_task_list_response.g.dart';

/// PaginatedResponseTaskListResponse
///
/// Properties:
/// * [items] 
/// * [total] 
/// * [limit] 
/// * [offset] 
/// * [hasMore] 
@BuiltValue()
abstract class PaginatedResponseTaskListResponse implements Built<PaginatedResponseTaskListResponse, PaginatedResponseTaskListResponseBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<TaskListResponse> get items;

  @BuiltValueField(wireName: r'total')
  int get total;

  @BuiltValueField(wireName: r'limit')
  int get limit;

  @BuiltValueField(wireName: r'offset')
  int get offset;

  @BuiltValueField(wireName: r'has_more')
  bool get hasMore;

  PaginatedResponseTaskListResponse._();

  factory PaginatedResponseTaskListResponse([void updates(PaginatedResponseTaskListResponseBuilder b)]) = _$PaginatedResponseTaskListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedResponseTaskListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedResponseTaskListResponse> get serializer => _$PaginatedResponseTaskListResponseSerializer();
}

class _$PaginatedResponseTaskListResponseSerializer implements PrimitiveSerializer<PaginatedResponseTaskListResponse> {
  @override
  final Iterable<Type> types = const [PaginatedResponseTaskListResponse, _$PaginatedResponseTaskListResponse];

  @override
  final String wireName = r'PaginatedResponseTaskListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedResponseTaskListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(TaskListResponse)]),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    yield r'limit';
    yield serializers.serialize(
      object.limit,
      specifiedType: const FullType(int),
    );
    yield r'offset';
    yield serializers.serialize(
      object.offset,
      specifiedType: const FullType(int),
    );
    yield r'has_more';
    yield serializers.serialize(
      object.hasMore,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedResponseTaskListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedResponseTaskListResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TaskListResponse)]),
          ) as BuiltList<TaskListResponse>;
          result.items.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.limit = valueDes;
          break;
        case r'offset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.offset = valueDes;
          break;
        case r'has_more':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasMore = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginatedResponseTaskListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedResponseTaskListResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

