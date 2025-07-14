//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'financial_summary.g.dart';

/// FinancialSummary
///
/// Properties:
/// * [subtotal] 
/// * [taxAmount] 
/// * [finalTotal] 
/// * [currency] 
@BuiltValue()
abstract class FinancialSummary implements Built<FinancialSummary, FinancialSummaryBuilder> {
  @BuiltValueField(wireName: r'subtotal')
  num? get subtotal;

  @BuiltValueField(wireName: r'taxAmount')
  num? get taxAmount;

  @BuiltValueField(wireName: r'finalTotal')
  num get finalTotal;

  @BuiltValueField(wireName: r'currency')
  String get currency;

  FinancialSummary._();

  factory FinancialSummary([void updates(FinancialSummaryBuilder b)]) = _$FinancialSummary;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FinancialSummaryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FinancialSummary> get serializer => _$FinancialSummarySerializer();
}

class _$FinancialSummarySerializer implements PrimitiveSerializer<FinancialSummary> {
  @override
  final Iterable<Type> types = const [FinancialSummary, _$FinancialSummary];

  @override
  final String wireName = r'FinancialSummary';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FinancialSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.subtotal != null) {
      yield r'subtotal';
      yield serializers.serialize(
        object.subtotal,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.taxAmount != null) {
      yield r'taxAmount';
      yield serializers.serialize(
        object.taxAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
    yield r'finalTotal';
    yield serializers.serialize(
      object.finalTotal,
      specifiedType: const FullType(num),
    );
    yield r'currency';
    yield serializers.serialize(
      object.currency,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FinancialSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FinancialSummaryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'subtotal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.subtotal = valueDes;
          break;
        case r'taxAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.taxAmount = valueDes;
          break;
        case r'finalTotal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.finalTotal = valueDes;
          break;
        case r'currency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currency = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FinancialSummary deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FinancialSummaryBuilder();
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

