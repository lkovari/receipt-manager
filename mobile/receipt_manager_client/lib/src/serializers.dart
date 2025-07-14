//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/discount.dart';
import 'package:openapi/src/model/exchange_rate.dart';
import 'package:openapi/src/model/financial_summary.dart';
import 'package:openapi/src/model/http_validation_error.dart';
import 'package:openapi/src/model/location.dart';
import 'package:openapi/src/model/login_request.dart';
import 'package:openapi/src/model/login_response.dart';
import 'package:openapi/src/model/merchant_info.dart';
import 'package:openapi/src/model/paginated_response_receipt_list_response.dart';
import 'package:openapi/src/model/paginated_response_task_list_response.dart';
import 'package:openapi/src/model/payment_info.dart';
import 'package:openapi/src/model/processing_status.dart';
import 'package:openapi/src/model/receipt_data.dart';
import 'package:openapi/src/model/receipt_item.dart';
import 'package:openapi/src/model/receipt_list_response.dart';
import 'package:openapi/src/model/receipt_processing_response.dart';
import 'package:openapi/src/model/receipt_response.dart';
import 'package:openapi/src/model/receipt_update.dart';
import 'package:openapi/src/model/refresh_request.dart';
import 'package:openapi/src/model/service_charge.dart';
import 'package:openapi/src/model/task_list_response.dart';
import 'package:openapi/src/model/task_status_response.dart';
import 'package:openapi/src/model/tax_detail.dart';
import 'package:openapi/src/model/validation_error.dart';
import 'package:openapi/src/model/validation_error_loc_inner.dart';

part 'serializers.g.dart';

@SerializersFor([
  Discount,
  ExchangeRate,
  FinancialSummary,
  HTTPValidationError,
  Location,
  LoginRequest,
  LoginResponse,
  MerchantInfo,
  PaginatedResponseReceiptListResponse,
  PaginatedResponseTaskListResponse,
  PaymentInfo,
  ProcessingStatus,
  ReceiptData,
  ReceiptItem,
  ReceiptListResponse,
  ReceiptProcessingResponse,
  ReceiptResponse,
  ReceiptUpdate,
  RefreshRequest,
  ServiceCharge,
  TaskListResponse,
  TaskStatusResponse,
  TaxDetail,
  ValidationError,
  ValidationErrorLocInner,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ReceiptResponse)]),
        () => ListBuilder<ReceiptResponse>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer())
    ).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
