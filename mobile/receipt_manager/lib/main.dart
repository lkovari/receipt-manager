import 'package:flutter/material.dart';
import 'package:receipt_manager/services/dio_factory.dart';
import 'package:receipt_manager/services/invoices_api.dart';
import 'package:receipt_manager/ui/camera_screen/camera_screen.dart';
import 'package:receipt_manager/ui/home_screen/home_screen.dart';
import 'package:receipt_manager/ui/invoice_screen/invoice_screen.dart';

void main() async {
   
  final authDio = await createDioWithAuth();
  final api = InvoiceService(authenticatedClient: authDio);

  runApp(AppScaffold(api: api));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppScaffold extends StatelessWidget {
  final InvoiceService api;

  const AppScaffold({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReceiptManager',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(invoicesApi: api),
        '/camera': (context) => CameraScreen(),
        '/invoice': (context) => InvoiceScreen(invoices: api),
      },
    );
  }
}
