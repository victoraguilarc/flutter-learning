import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'keyboard_arrow_right': Icons.keyboard_arrow_right,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'slider': Icons.tune,
  'list': Icons.list,
};

Icon getIcon(String iconRepr) {
  return Icon(_icons[iconRepr], color: Colors.blue);
}
