import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

LatLng toLatLng(LocationData? location) => LatLng(location?.latitude ?? 0, location?.longitude ?? 0);

// extension on LocationData {
//   LatLng get fromLocationData => LatLng(latitude ?? 0, longitude ?? 0);
// }
