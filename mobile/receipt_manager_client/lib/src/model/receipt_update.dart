//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/receipt_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'receipt_update.g.dart';

/// ReceiptUpdate
///
/// Properties:
/// * [receiptData] 
/// * [imageUrl] 
@BuiltValue()
abstract class ReceiptUpdate implements Built<ReceiptUpdate, ReceiptUpdateBuilder> {
  @BuiltValueField(wireName: r'receipt_data')
  ReceiptData? get receiptData;

  @BuiltValueField(wireName: r'image_url')
  String? get imageUrl;

  ReceiptUpdate._();

  factory ReceiptUpdate([void updates(ReceiptUpdateBuilder b)]) = _$ReceiptUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReceiptUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReceiptUpdate> get serializer => _$ReceiptUpdateSerializer();
}

class _$ReceiptUpdateSerializer implements PrimitiveSerializer<ReceiptUpdate> {
  @override
  final Iterable<Type> types = const [ReceiptUpdate, _$ReceiptUpdate];

  @override
  final String wireName = r'ReceiptUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReceiptUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.receiptData != null) {
      yield r'receipt_data';
      yield serializers.serialize(
        object.receiptData,
        specifiedType: const FullType.nullable(ReceiptData),
      );
    }
    if (object.imageUrl != null) {
      yield r'image_url';
      yield serializers.serialize(
        object.imageUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReceiptUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReceiptUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'receipt_data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ReceiptData),
          ) as ReceiptData?;
          if (valueDes == null) continue;
          result.receiptData.replace(valueDes);
          break;
        case r'image_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.imageUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReceiptUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReceiptUpdateBuilder();
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

