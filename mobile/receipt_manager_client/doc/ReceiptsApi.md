# openapi.api.ReceiptsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getReceiptByIdReceiptsReceiptIdGet**](ReceiptsApi.md#getreceiptbyidreceiptsreceiptidget) | **GET** /receipts/{receipt_id} | Get Receipt By Id
[**getUserReceiptStatisticsReceiptsStatisticsGet**](ReceiptsApi.md#getuserreceiptstatisticsreceiptsstatisticsget) | **GET** /receipts/statistics/ | Get User Receipt Statistics
[**listUserReceiptsReceiptsGet**](ReceiptsApi.md#listuserreceiptsreceiptsget) | **GET** /receipts/ | List User Receipts
[**processReceiptImageReceiptsProcessPost**](ReceiptsApi.md#processreceiptimagereceiptsprocesspost) | **POST** /receipts/process | Process Receipt Image
[**searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet**](ReceiptsApi.md#searchreceiptsbyitemcategoryreceiptssearchcategorycategoryget) | **GET** /receipts/search/category/{category} | Search Receipts By Item Category
[**searchUserReceiptsReceiptsSearchGet**](ReceiptsApi.md#searchuserreceiptsreceiptssearchget) | **GET** /receipts/search/ | Search User Receipts
[**updateReceiptByIdReceiptsReceiptIdPut**](ReceiptsApi.md#updatereceiptbyidreceiptsreceiptidput) | **PUT** /receipts/{receipt_id} | Update Receipt By Id


# **getReceiptByIdReceiptsReceiptIdGet**
> ReceiptResponse getReceiptByIdReceiptsReceiptIdGet(receiptId)

Get Receipt By Id

Get a specific receipt by ID

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReceiptsApi();
final String receiptId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getReceiptByIdReceiptsReceiptIdGet(receiptId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReceiptsApi->getReceiptByIdReceiptsReceiptIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **receiptId** | **String**|  | 

### Return type

[**ReceiptResponse**](ReceiptResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserReceiptStatisticsReceiptsStatisticsGet**
> JsonObject getUserReceiptStatisticsReceiptsStatisticsGet()

Get User Receipt Statistics

Get receipt statistics for the current user

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReceiptsApi();

try {
    final response = api.getUserReceiptStatisticsReceiptsStatisticsGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReceiptsApi->getUserReceiptStatisticsReceiptsStatisticsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUserReceiptsReceiptsGet**
> PaginatedResponseReceiptListResponse listUserReceiptsReceiptsGet(limit, offset)

List User Receipts

Get all receipts for the current user with pagination

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReceiptsApi();
final int limit = 56; // int | 
final int offset = 56; // int | 

try {
    final response = api.listUserReceiptsReceiptsGet(limit, offset);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReceiptsApi->listUserReceiptsReceiptsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**|  | [optional] [default to 50]
 **offset** | **int**|  | [optional] [default to 0]

### Return type

[**PaginatedResponseReceiptListResponse**](PaginatedResponseReceiptListResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **processReceiptImageReceiptsProcessPost**
> ReceiptProcessingResponse processReceiptImageReceiptsProcessPost(file)

Process Receipt Image

Upload a receipt image, store it in Cloudinary, and start processing with Gemini LLM

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReceiptsApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.processReceiptImageReceiptsProcessPost(file);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReceiptsApi->processReceiptImageReceiptsProcessPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | 

### Return type

[**ReceiptProcessingResponse**](ReceiptProcessingResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet**
> BuiltList<ReceiptResponse> searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet(category)

Search Receipts By Item Category

Search receipts by item category

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReceiptsApi();
final String category = category_example; // String | 

try {
    final response = api.searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet(category);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReceiptsApi->searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **String**|  | 

### Return type

[**BuiltList&lt;ReceiptResponse&gt;**](ReceiptResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchUserReceiptsReceiptsSearchGet**
> BuiltList<ReceiptResponse> searchUserReceiptsReceiptsSearchGet(merchant, minTotal, maxTotal, startDate, endDate)

Search User Receipts

Search receipts with filters

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReceiptsApi();
final String merchant = merchant_example; // String | 
final num minTotal = 8.14; // num | 
final num maxTotal = 8.14; // num | 
final String startDate = startDate_example; // String | 
final String endDate = endDate_example; // String | 

try {
    final response = api.searchUserReceiptsReceiptsSearchGet(merchant, minTotal, maxTotal, startDate, endDate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReceiptsApi->searchUserReceiptsReceiptsSearchGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant** | **String**|  | [optional] 
 **minTotal** | **num**|  | [optional] 
 **maxTotal** | **num**|  | [optional] 
 **startDate** | **String**|  | [optional] 
 **endDate** | **String**|  | [optional] 

### Return type

[**BuiltList&lt;ReceiptResponse&gt;**](ReceiptResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateReceiptByIdReceiptsReceiptIdPut**
> ReceiptResponse updateReceiptByIdReceiptsReceiptIdPut(receiptId, receiptUpdate)

Update Receipt By Id

Update a receipt

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReceiptsApi();
final String receiptId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ReceiptUpdate receiptUpdate = ; // ReceiptUpdate | 

try {
    final response = api.updateReceiptByIdReceiptsReceiptIdPut(receiptId, receiptUpdate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReceiptsApi->updateReceiptByIdReceiptsReceiptIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **receiptId** | **String**|  | 
 **receiptUpdate** | [**ReceiptUpdate**](ReceiptUpdate.md)|  | 

### Return type

[**ReceiptResponse**](ReceiptResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

