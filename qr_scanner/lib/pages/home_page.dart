import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/pages/addresses_page.dart';
import 'package:qr_scanner/pages/history_page.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/custom_navigation.dart';
import 'package:qr_scanner/widgets/scan_buttom.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              final provider = Provider.of<ScanListProvider>(
                context,
                listen: false,
              );
              provider.deleteAllScans();
              provider.refreshScans();
            },
            icon: Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);

    final currentIndex = uiProvider.selectedIndex;
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return HistoryPage();
      case 1:
        scanListProvider.loadScansByType('http');
        return AddressesPage();
      default:
        return HistoryPage();
    }
  }
}
