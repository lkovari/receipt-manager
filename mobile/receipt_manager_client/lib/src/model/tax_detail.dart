//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tax_detail.g.dart';

/// TaxDetail
///
/// Properties:
/// * [rate] 
/// * [taxableAmount] 
/// * [taxAmount] 
/// * [totalWithTax] 
/// * [currency] 
@BuiltValue()
abstract class TaxDetail implements Built<TaxDetail, TaxDetailBuilder> {
  @BuiltValueField(wireName: r'rate')
  String? get rate;

  @BuiltValueField(wireName: r'taxableAmount')
  num? get taxableAmount;

  @BuiltValueField(wireName: r'taxAmount')
  num? get taxAmount;

  @BuiltValueField(wireName: r'totalWithTax')
  num? get totalWithTax;

  @BuiltValueField(wireName: r'currency')
  String get currency;

  TaxDetail._();

  factory TaxDetail([void updates(TaxDetailBuilder b)]) = _$TaxDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaxDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaxDetail> get serializer => _$TaxDetailSerializer();
}

class _$TaxDetailSerializer implements PrimitiveSerializer<TaxDetail> {
  @override
  final Iterable<Type> types = const [TaxDetail, _$TaxDetail];

  @override
  final String wireName = r'TaxDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaxDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.rate != null) {
      yield r'rate';
      yield serializers.serialize(
        object.rate,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.taxableAmount != null) {
      yield r'taxableAmount';
      yield serializers.serialize(
        object.taxableAmount,
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
    if (object.totalWithTax != null) {
      yield r'totalWithTax';
      yield serializers.serialize(
        object.totalWithTax,
        specifiedType: const FullType.nullable(num),
      );
    }
    yield r'currency';
    yield serializers.serialize(
      object.currency,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TaxDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TaxDetailBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'rate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.rate = valueDes;
          break;
        case r'taxableAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.taxableAmount = valueDes;
          break;
        case r'taxAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.taxAmount = valueDes;
          break;
        case r'totalWithTax':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.totalWithTax = valueDes;
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
  TaxDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaxDetailBuilder();
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

