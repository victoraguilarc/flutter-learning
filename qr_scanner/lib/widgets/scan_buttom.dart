import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        final provider = Provider.of<ScanListProvider>(context, listen: false);
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3d8bef',
          'Cancelar',
          false,
          ScanMode.QR,
        );
        // String barcodeScanRes = 'geo:19.3800408,-99.1901889';
        if (barcodeScanRes == '-1') {
          return;
        }
        // provider.newScan('http://hola.mundo');
        provider.newScan(barcodeScanRes);
        // provider.refreshScans();
      },
    );
  }
}
