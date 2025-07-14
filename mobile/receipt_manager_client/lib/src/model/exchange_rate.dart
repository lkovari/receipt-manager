//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exchange_rate.g.dart';

/// ExchangeRate
///
/// Properties:
/// * [currency] 
/// * [rate] 
/// * [equivalentAmount] 
@BuiltValue()
abstract class ExchangeRate implements Built<ExchangeRate, ExchangeRateBuilder> {
  @BuiltValueField(wireName: r'currency')
  String? get currency;

  @BuiltValueField(wireName: r'rate')
  num? get rate;

  @BuiltValueField(wireName: r'equivalentAmount')
  num? get equivalentAmount;

  ExchangeRate._();

  factory ExchangeRate([void updates(ExchangeRateBuilder b)]) = _$ExchangeRate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExchangeRateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExchangeRate> get serializer => _$ExchangeRateSerializer();
}

class _$ExchangeRateSerializer implements PrimitiveSerializer<ExchangeRate> {
  @override
  final Iterable<Type> types = const [ExchangeRate, _$ExchangeRate];

  @override
  final String wireName = r'ExchangeRate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExchangeRate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.currency != null) {
      yield r'currency';
      yield serializers.serialize(
        object.currency,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.rate != null) {
      yield r'rate';
      yield serializers.serialize(
        object.rate,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.equivalentAmount != null) {
      yield r'equivalentAmount';
      yield serializers.serialize(
        object.equivalentAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExchangeRate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExchangeRateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'currency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currency = valueDes;
          break;
        case r'rate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.rate = valueDes;
          break;
        case r'equivalentAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.equivalentAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExchangeRate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExchangeRateBuilder();
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

