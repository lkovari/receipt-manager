import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:receipt_manager/services/invoices_api.dart';
import 'package:receipt_manager/ui/custom_expansion_tile.dart';
import 'package:receipt_manager/ui/hold_floating_widget.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreen extends StatefulWidget {
  final InvoiceService invoicesApi;

  const HomeScreen({super.key, required this.invoicesApi});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();
  late final AsyncSignal<List<ReceiptListResponse>> _invoicesFu = asyncSignal(
    AsyncLoading(),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshKey.currentState?.show();
    });
  }

  refresh() async {
    try {
      final invoicses = await widget.invoicesApi.getInvoices();
      final urlsToPreload = invoicses
          .map((e) => e.imageUrl ?? "")
          .where((e) => e.isNotEmpty);
      await Future.wait(
        urlsToPreload.map((element) async {
          if (!mounted) return;
          await precacheImage(NetworkImage(element), context);
        }),
      );
      _invoicesFu.setValue(invoicses);
    } catch (e) {
      _invoicesFu.setError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(9, 0, 0, 0),
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(0, -0),
            ),
          ],
          border: Border.all(
            color: const Color.fromARGB(47, 255, 255, 255),
            width: 1,
          ),
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/camera');
          },
          icon: Icon(Icons.camera_alt),
          label: Text('Scan Receipt', style: TextStyle(fontSize: 17)),
          backgroundColor:
              Theme.of(context).floatingActionButtonTheme.backgroundColor ??
              Theme.of(context).colorScheme.primaryContainer,
          foregroundColor:
              Theme.of(context).floatingActionButtonTheme.foregroundColor ??
              Theme.of(context).colorScheme.onPrimaryContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ), // Adjust the radius as needed
          ),
        ),
      ),
      body: Watch((context) {
        return RefreshIndicator(
          key: _refreshKey,
          onRefresh: () async => await refresh(),
          child: _invoicesFu().map(
            loading: () => CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('All receipts'),
                  floating: true,
                  snap: true,
                  forceElevated: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        24,
                      ), // Adjust the radius as needed
                    ),
                  ),
                ),
              ],
            ),
            data: (invoices) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text('All receipts'),
                    floating: true,
                    snap: true,
                    forceElevated: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(
                          24,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 15), // Adjust height as needed
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final invoice = invoices[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(13, 0, 13, 6),
                        child: TrueExpandableTile(
                          title: invoice.merchant ?? "Unknown",
                          subtext: '${invoice.total} ${invoice.currency}',
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 5, 0, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('• ', style: TextStyle(fontSize: 20)),
                                    Expanded(
                                      child: Text(
                                        'Date created: ${invoice.createdAt}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('• ', style: TextStyle(fontSize: 20)),
                                    HoldFloatingImageWidget(
                                      floatingChild: Container(
                                        decoration: BoxDecoration(
                                           
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(width: 2, color: Colors.black12),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ), // rounded corners
                                          child: SizedBox(
                                            width: 250,
                                            height: 500,
                                            child: Image.network(
                                              invoice.imageUrl ?? "",
                                              fit: BoxFit.fill,
                                              loadingBuilder:
                                                  (
                                                    context,
                                                    child,
                                                    loadingProgress,
                                                  ) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  },
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => Center(
                                                    child: Icon(
                                                      Icons.error,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Hold to see image",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }, childCount: invoices.length),
                  ),
                ],
              );
            },
            error: (error) => CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('All receipts'),
                  floating: true,
                  snap: true,
                  forceElevated: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        24,
                      ), // Adjust the radius as needed
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Text('Error loading invoices: $error'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
