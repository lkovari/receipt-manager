import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'package:receipt_manager/services/models/invoice.dart';
import 'package:receipt_manager/services/models/invoice_item.dart';

class InvoiceService {
  final Dio authenticatedClient;
  late final ReceiptsApi generated;
  late final TasksApi tasksApi;

  InvoiceService({required this.authenticatedClient})
    : generated = ReceiptsApi(authenticatedClient, standardSerializers),
      tasksApi = TasksApi(authenticatedClient, standardSerializers);

  Future<void> test() async {
    await generated.listUserReceiptsReceiptsGet(limit: 50, offset: 0);
  }

  Future<ReceiptResponse> addInvoice(String filePath) async {
    // final inv2 = await generated.getReceiptByIdReceiptsReceiptIdGet(
    //   receiptId: "2ec29b2b-f343-4b7c-9ee3-85a69e04a845",
    // );

    // return inv2.data!;
   
    final file = await MultipartFile.fromFile(filePath);
    final processResult = await generated
        .processReceiptImageReceiptsProcessPost(file: file);

    final taskId = processResult.data!.taskId;
    String? receiptId;
    await pollWithTimeout(
      checkCondition: () async {
        final res = await tasksApi.getTaskStatusTasksTaskIdGet(taskId: taskId);
        if (res.data?.receiptId != null) {
          receiptId = res.data!.receiptId;
          return true;
        } else if (res.data?.errorMessage != null) {
          throw Exception(res.data!.errorMessage);
        }
        return false;
      },
    );

    final inv = await generated.getReceiptByIdReceiptsReceiptIdGet(
      receiptId: receiptId!,
    );

    return inv.data!;
  }

  Future<List<ReceiptListResponse>> getInvoices() async {
    //     await Future.delayed(Duration(milliseconds: 100));
    // return [ReceiptListResponse((b) => b..id = "kk"..userId="kk"..total=3..createdAt=DateTime(2020))];

    final result = await generated.listUserReceiptsReceiptsGet(
      limit: 7,
      offset: 0,
    );
    if (result.data?.items == null) {
      return [];
    }
    return result.data!.items.toList();
  }
}

Future<void> pollWithTimeout({
  required Future<bool> Function() checkCondition,
  Duration interval = const Duration(seconds: 2),
  Duration timeout = const Duration(seconds: 30),
}) async {
  final completer = Completer<void>();
  final stopwatch = Stopwatch()..start();

  Timer.periodic(interval, (timer) async {
    try {
      if (await checkCondition()) {
        timer.cancel();
        completer.complete(); // ✅ Condition met
      } else if (stopwatch.elapsed >= timeout) {
        timer.cancel();
        completer.completeError('⏳ Timeout reached');
      }
    } catch (e) {
      timer.cancel();
      completer.completeError(e.toString());
    }
  });

  return completer.future;
}

final _random = Random();
