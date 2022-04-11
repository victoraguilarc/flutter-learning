// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {
  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) {
    if (this.value.contains('http')) {
      this.type = 'http';
    } else {
      this.type = 'geo';
    }
  }

  int? id;
  String? type;
  String value;

  LatLng getLatLng() {
    final latLng = this.value.substring(4).split(',');
    final lat = double.parse( latLng[0] );
    final lng = double.parse( latLng[1] );

    return LatLng( lat, lng );
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "value": value,
  };
}
