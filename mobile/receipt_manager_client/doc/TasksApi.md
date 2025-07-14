# openapi.api.TasksApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTaskStatusTasksTaskIdGet**](TasksApi.md#gettaskstatustaskstaskidget) | **GET** /tasks/{task_id} | Get Task Status
[**listUserTasksTasksGet**](TasksApi.md#listusertaskstasksget) | **GET** /tasks/ | List User Tasks


# **getTaskStatusTasksTaskIdGet**
> TaskStatusResponse getTaskStatusTasksTaskIdGet(taskId)

Get Task Status

Get the status of a specific task

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTasksApi();
final String taskId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getTaskStatusTasksTaskIdGet(taskId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TasksApi->getTaskStatusTasksTaskIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **taskId** | **String**|  | 

### Return type

[**TaskStatusResponse**](TaskStatusResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUserTasksTasksGet**
> PaginatedResponseTaskListResponse listUserTasksTasksGet(limit, offset)

List User Tasks

Get all receipt processing tasks for the current user with pagination

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTasksApi();
final int limit = 56; // int | 
final int offset = 56; // int | 

try {
    final response = api.listUserTasksTasksGet(limit, offset);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TasksApi->listUserTasksTasksGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**|  | [optional] [default to 50]
 **offset** | **int**|  | [optional] [default to 0]

### Return type

[**PaginatedResponseTaskListResponse**](PaginatedResponseTaskListResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

