import 'package:flutter/foundation.dart';

class UIProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex {
    return this._selectedIndex;
  }

  set selectedIndex(int i) {
    this._selectedIndex = i;
    notifyListeners();
  }
}
