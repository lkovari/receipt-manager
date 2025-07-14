//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/processing_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'receipt_processing_response.g.dart';

/// ReceiptProcessingResponse
///
/// Properties:
/// * [taskId] 
/// * [status] 
/// * [message] 
@BuiltValue()
abstract class ReceiptProcessingResponse implements Built<ReceiptProcessingResponse, ReceiptProcessingResponseBuilder> {
  @BuiltValueField(wireName: r'task_id')
  String get taskId;

  @BuiltValueField(wireName: r'status')
  ProcessingStatus get status;
  // enum statusEnum {  pending,  processing,  completed,  failed,  };

  @BuiltValueField(wireName: r'message')
  String get message;

  ReceiptProcessingResponse._();

  factory ReceiptProcessingResponse([void updates(ReceiptProcessingResponseBuilder b)]) = _$ReceiptProcessingResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReceiptProcessingResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReceiptProcessingResponse> get serializer => _$ReceiptProcessingResponseSerializer();
}

class _$ReceiptProcessingResponseSerializer implements PrimitiveSerializer<ReceiptProcessingResponse> {
  @override
  final Iterable<Type> types = const [ReceiptProcessingResponse, _$ReceiptProcessingResponse];

  @override
  final String wireName = r'ReceiptProcessingResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReceiptProcessingResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'task_id';
    yield serializers.serialize(
      object.taskId,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ProcessingStatus),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReceiptProcessingResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReceiptProcessingResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'task_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.taskId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ProcessingStatus),
          ) as ProcessingStatus;
          result.status = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReceiptProcessingResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReceiptProcessingResponseBuilder();
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

