//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/location.dart';
import 'package:openapi/src/model/merchant_info.dart';
import 'package:openapi/src/model/financial_summary.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/payment_info.dart';
import 'package:openapi/src/model/discount.dart';
import 'package:openapi/src/model/service_charge.dart';
import 'package:openapi/src/model/tax_detail.dart';
import 'package:openapi/src/model/exchange_rate.dart';
import 'package:openapi/src/model/receipt_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'receipt_data.g.dart';

/// ReceiptData
///
/// Properties:
/// * [isValid] 
/// * [merchantInfo] 
/// * [location] 
/// * [dateTime] 
/// * [items] 
/// * [financialSummary] 
/// * [taxDetails] 
/// * [discounts] 
/// * [serviceCharge] 
/// * [paymentInfo] 
/// * [exchangeRate] 
/// * [notes] 
/// * [handwrittenNotes] 
@BuiltValue()
abstract class ReceiptData implements Built<ReceiptData, ReceiptDataBuilder> {
  @BuiltValueField(wireName: r'isValid')
  bool get isValid;

  @BuiltValueField(wireName: r'merchantInfo')
  MerchantInfo get merchantInfo;

  @BuiltValueField(wireName: r'location')
  Location get location;

  @BuiltValueField(wireName: r'dateTime')
  String? get dateTime;

  @BuiltValueField(wireName: r'items')
  BuiltList<ReceiptItem> get items;

  @BuiltValueField(wireName: r'financialSummary')
  FinancialSummary get financialSummary;

  @BuiltValueField(wireName: r'taxDetails')
  BuiltList<TaxDetail>? get taxDetails;

  @BuiltValueField(wireName: r'discounts')
  BuiltList<Discount>? get discounts;

  @BuiltValueField(wireName: r'serviceCharge')
  ServiceCharge? get serviceCharge;

  @BuiltValueField(wireName: r'paymentInfo')
  PaymentInfo get paymentInfo;

  @BuiltValueField(wireName: r'exchangeRate')
  ExchangeRate? get exchangeRate;

  @BuiltValueField(wireName: r'notes')
  BuiltList<String>? get notes;

  @BuiltValueField(wireName: r'handwrittenNotes')
  BuiltList<String>? get handwrittenNotes;

  ReceiptData._();

  factory ReceiptData([void updates(ReceiptDataBuilder b)]) = _$ReceiptData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReceiptDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReceiptData> get serializer => _$ReceiptDataSerializer();
}

class _$ReceiptDataSerializer implements PrimitiveSerializer<ReceiptData> {
  @override
  final Iterable<Type> types = const [ReceiptData, _$ReceiptData];

  @override
  final String wireName = r'ReceiptData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReceiptData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'isValid';
    yield serializers.serialize(
      object.isValid,
      specifiedType: const FullType(bool),
    );
    yield r'merchantInfo';
    yield serializers.serialize(
      object.merchantInfo,
      specifiedType: const FullType(MerchantInfo),
    );
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(Location),
    );
    if (object.dateTime != null) {
      yield r'dateTime';
      yield serializers.serialize(
        object.dateTime,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(ReceiptItem)]),
    );
    yield r'financialSummary';
    yield serializers.serialize(
      object.financialSummary,
      specifiedType: const FullType(FinancialSummary),
    );
    if (object.taxDetails != null) {
      yield r'taxDetails';
      yield serializers.serialize(
        object.taxDetails,
        specifiedType: const FullType.nullable(BuiltList, [FullType(TaxDetail)]),
      );
    }
    if (object.discounts != null) {
      yield r'discounts';
      yield serializers.serialize(
        object.discounts,
        specifiedType: const FullType.nullable(BuiltList, [FullType(Discount)]),
      );
    }
    if (object.serviceCharge != null) {
      yield r'serviceCharge';
      yield serializers.serialize(
        object.serviceCharge,
        specifiedType: const FullType.nullable(ServiceCharge),
      );
    }
    yield r'paymentInfo';
    yield serializers.serialize(
      object.paymentInfo,
      specifiedType: const FullType(PaymentInfo),
    );
    if (object.exchangeRate != null) {
      yield r'exchangeRate';
      yield serializers.serialize(
        object.exchangeRate,
        specifiedType: const FullType.nullable(ExchangeRate),
      );
    }
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.handwrittenNotes != null) {
      yield r'handwrittenNotes';
      yield serializers.serialize(
        object.handwrittenNotes,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReceiptData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReceiptDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'isValid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isValid = valueDes;
          break;
        case r'merchantInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MerchantInfo),
          ) as MerchantInfo;
          result.merchantInfo.replace(valueDes);
          break;
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Location),
          ) as Location;
          result.location.replace(valueDes);
          break;
        case r'dateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dateTime = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ReceiptItem)]),
          ) as BuiltList<ReceiptItem>;
          result.items.replace(valueDes);
          break;
        case r'financialSummary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FinancialSummary),
          ) as FinancialSummary;
          result.financialSummary.replace(valueDes);
          break;
        case r'taxDetails':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(TaxDetail)]),
          ) as BuiltList<TaxDetail>?;
          if (valueDes == null) continue;
          result.taxDetails.replace(valueDes);
          break;
        case r'discounts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(Discount)]),
          ) as BuiltList<Discount>?;
          if (valueDes == null) continue;
          result.discounts.replace(valueDes);
          break;
        case r'serviceCharge':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ServiceCharge),
          ) as ServiceCharge?;
          if (valueDes == null) continue;
          result.serviceCharge.replace(valueDes);
          break;
        case r'paymentInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentInfo),
          ) as PaymentInfo;
          result.paymentInfo.replace(valueDes);
          break;
        case r'exchangeRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ExchangeRate),
          ) as ExchangeRate?;
          if (valueDes == null) continue;
          result.exchangeRate.replace(valueDes);
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.notes.replace(valueDes);
          break;
        case r'handwrittenNotes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.handwrittenNotes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReceiptData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReceiptDataBuilder();
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

