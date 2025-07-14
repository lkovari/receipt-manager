# openapi.model.ReceiptData

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**isValid** | **bool** |  | 
**merchantInfo** | [**MerchantInfo**](MerchantInfo.md) |  | 
**location** | [**Location**](Location.md) |  | 
**dateTime** | **String** |  | [optional] 
**items** | [**BuiltList&lt;ReceiptItem&gt;**](ReceiptItem.md) |  | 
**financialSummary** | [**FinancialSummary**](FinancialSummary.md) |  | 
**taxDetails** | [**BuiltList&lt;TaxDetail&gt;**](TaxDetail.md) |  | [optional] 
**discounts** | [**BuiltList&lt;Discount&gt;**](Discount.md) |  | [optional] 
**serviceCharge** | [**ServiceCharge**](ServiceCharge.md) |  | [optional] 
**paymentInfo** | [**PaymentInfo**](PaymentInfo.md) |  | 
**exchangeRate** | [**ExchangeRate**](ExchangeRate.md) |  | [optional] 
**notes** | **BuiltList&lt;String&gt;** |  | [optional] 
**handwrittenNotes** | **BuiltList&lt;String&gt;** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


