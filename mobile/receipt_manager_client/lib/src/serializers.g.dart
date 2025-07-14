// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add(Discount.serializer)
      ..add(ExchangeRate.serializer)
      ..add(FinancialSummary.serializer)
      ..add(HTTPValidationError.serializer)
      ..add(Location.serializer)
      ..add(LoginRequest.serializer)
      ..add(LoginResponse.serializer)
      ..add(MerchantInfo.serializer)
      ..add(PaginatedResponseReceiptListResponse.serializer)
      ..add(PaginatedResponseTaskListResponse.serializer)
      ..add(PaymentInfo.serializer)
      ..add(ProcessingStatus.serializer)
      ..add(ReceiptData.serializer)
      ..add(ReceiptItem.serializer)
      ..add(ReceiptListResponse.serializer)
      ..add(ReceiptProcessingResponse.serializer)
      ..add(ReceiptResponse.serializer)
      ..add(ReceiptUpdate.serializer)
      ..add(RefreshRequest.serializer)
      ..add(ServiceCharge.serializer)
      ..add(TaskListResponse.serializer)
      ..add(TaskStatusResponse.serializer)
      ..add(TaxDetail.serializer)
      ..add(ValidationError.serializer)
      ..add(ValidationErrorLocInner.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ReceiptItem)]),
          () => ListBuilder<ReceiptItem>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TaxDetail)]),
          () => ListBuilder<TaxDetail>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Discount)]),
          () => ListBuilder<Discount>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ReceiptListResponse)]),
          () => ListBuilder<ReceiptListResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TaskListResponse)]),
          () => ListBuilder<TaskListResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ValidationError)]),
          () => ListBuilder<ValidationError>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ValidationErrorLocInner)]),
          () => ListBuilder<ValidationErrorLocInner>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType.nullable(JsonObject)
          ]),
          () => MapBuilder<String, JsonObject?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
