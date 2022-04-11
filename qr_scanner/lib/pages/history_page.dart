import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(type: 'geo');
  }
}
