//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_info.g.dart';

/// PaymentInfo
///
/// Properties:
/// * [type] 
/// * [terminalId] 
/// * [transactionId] 
/// * [slip] 
/// * [bankCardType] 
@BuiltValue()
abstract class PaymentInfo implements Built<PaymentInfo, PaymentInfoBuilder> {
  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'terminalId')
  String? get terminalId;

  @BuiltValueField(wireName: r'transactionId')
  String? get transactionId;

  @BuiltValueField(wireName: r'slip')
  String? get slip;

  @BuiltValueField(wireName: r'bankCardType')
  String? get bankCardType;

  PaymentInfo._();

  factory PaymentInfo([void updates(PaymentInfoBuilder b)]) = _$PaymentInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentInfo> get serializer => _$PaymentInfoSerializer();
}

class _$PaymentInfoSerializer implements PrimitiveSerializer<PaymentInfo> {
  @override
  final Iterable<Type> types = const [PaymentInfo, _$PaymentInfo];

  @override
  final String wireName = r'PaymentInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.terminalId != null) {
      yield r'terminalId';
      yield serializers.serialize(
        object.terminalId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.transactionId != null) {
      yield r'transactionId';
      yield serializers.serialize(
        object.transactionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.slip != null) {
      yield r'slip';
      yield serializers.serialize(
        object.slip,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.bankCardType != null) {
      yield r'bankCardType';
      yield serializers.serialize(
        object.bankCardType,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaymentInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaymentInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.type = valueDes;
          break;
        case r'terminalId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.terminalId = valueDes;
          break;
        case r'transactionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.transactionId = valueDes;
          break;
        case r'slip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.slip = valueDes;
          break;
        case r'bankCardType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.bankCardType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaymentInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentInfoBuilder();
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

