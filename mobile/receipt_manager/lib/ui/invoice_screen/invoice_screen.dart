import 'dart:async';

import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:receipt_manager/services/invoices_api.dart';
import 'package:receipt_manager/ui/custom_styled_list_tile.dart';
import 'package:receipt_manager/ui/timed_progress_bar.dart';
import 'package:signals/signals_flutter.dart';

class InvoiceScreen extends StatefulWidget {
  final InvoiceService invoices;

  const InvoiceScreen({super.key, required this.invoices});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final Signal<String?> _photoPath = Signal<String?>(null);
  late FutureSignal<ReceiptResponse> _invoice;

  _InvoiceScreenState() {
    _invoice = futureSignal(() async {
      var path = _photoPath();
      if (path != null && path.isNotEmpty) {
        return widget.invoices.addInvoice(path);
      } else {
        await loadForever();
        throw Exception('No photo path provided');
      }
    });
  }
  Future<void> loadForever() {
    return Completer<void>().future; // never completes
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final photoPath = ModalRoute.of(context)?.settings.arguments as String;
    _photoPath.set(photoPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Watch(
        (context) => _invoice().map(
          loading: () => CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('All receipts'),
                floating: true,
                snap: true,
                forceElevated: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24), // Adjust the radius as needed
                  ),
                ),
              ),
             SliverFillRemaining(
               child: Center(
                 child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TimedProgressBar(
                      duration: Duration(seconds: 30),
                      done: false,
                      messages: [
                        TimedMessage(Duration(seconds: 0), "🛜 Uploading image..."),
                        TimedMessage(Duration(seconds: 5), "🔎 Starting analyze..."),
                        TimedMessage(Duration(seconds: 10), "👮 Checking for illegal items..."),
                        TimedMessage(Duration(seconds: 17), "☕ Quick offee break!"),
                        TimedMessage(Duration(seconds: 25), "🗄️ Back to itemizing items..."),
                        TimedMessage(Duration(seconds: 25), "⛷️ Finishing up..."),
                      ],
                    ),
                  ),
               ),
             ) 
            ],
          ),
          data: (invoice) => CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('All receipts'),
                floating: true,
                snap: true,
                forceElevated: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24), // Adjust the radius as needed
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 15), // Adjust height as needed
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = invoice.receiptData.items[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(13, 0, 13, 6),
                    child: CustomStyledListTile(
                      title: item.description,
                      subtext: 'Price: ${item.lineTotal}',
                    ),
                  );
                }, childCount: invoice.receiptData.items.length),
              ),
            ],
          ),
          error: (error) => CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('All receipts'),
                floating: true,
                snap: true,
                forceElevated: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24), // Adjust the radius as needed
                  ),
                ),
              ),
             SliverFillRemaining(child: Center(child: Text('Error: $error'))) 
            ],
          ),
        ),
      ),
    );
  }
}
