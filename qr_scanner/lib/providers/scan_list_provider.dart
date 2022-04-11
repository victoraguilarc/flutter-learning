import 'package:flutter/foundation.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if (this.selectedType == newScan.type) {
      this.scans.add(newScan);
    }
    notifyListeners();
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...scans];
    notifyListeners();
  }

  refreshScans() async {
    final scans = await DBProvider.db.getScansByType(this.selectedType);
    this.scans = [...scans];
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    notifyListeners();
  }

  deleteById(int id) async {
    await DBProvider.db.deleteScan(id);
  }
}
