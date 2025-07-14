import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for TasksApi
void main() {
  final instance = Openapi().getTasksApi();

  group(TasksApi, () {
    // Get Task Status
    //
    // Get the status of a specific task
    //
    //Future<TaskStatusResponse> getTaskStatusTasksTaskIdGet(String taskId) async
    test('test getTaskStatusTasksTaskIdGet', () async {
      // TODO
    });

    // List User Tasks
    //
    // Get all receipt processing tasks for the current user with pagination
    //
    //Future<PaginatedResponseTaskListResponse> listUserTasksTasksGet({ int limit, int offset }) async
    test('test listUserTasksTasksGet', () async {
      // TODO
    });

  });
}
