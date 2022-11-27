import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//this is the function to load custom map style json
void loadMapStyle(GoogleMapController mapController) {
  getJsonFile("assets/map_styles/standard.json").then((value) => mapController.setMapStyle(value));
}

//helper function
Future<String> getJsonFile(String path) async {
  ByteData byte = await rootBundle.load(path);
  var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
  return utf8.decode(list);
}
