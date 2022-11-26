import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

Location locationService = Location();

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  static const LatLng clientLocation = LatLng(37.33429383, -122.06600055);

  final Completer<GoogleMapController> _controller = Completer();
  LocationData? currentLocation;

  List<LatLng> polylineCoordinates = [];
  double zoom = 16;

  BitmapDescriptor clientIcons = BitmapDescriptor.defaultMarker;
  BitmapDescriptor workersIcons = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });

    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLocation) {
        currentLocation = newLocation;
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(getCurrentCameraPosition()));
        setState(() {});
      },
    );
  }

  CameraPosition getCurrentCameraPosition() {
    return CameraPosition(
      target: LatLng(currentLocation?.latitude ?? 0, currentLocation?.longitude ?? 0),
      zoom: zoom,
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    generateIcons();
    super.initState();
  }

  generateIcons() async {
    clientIcons = await setCustomMarkerIcon(Icons.location_pin, Colors.amber, 128);
    workersIcons = await setCustomMarkerIcon(Icons.engineering, Colors.grey, 128);
  }

  Future<BitmapDescriptor> setCustomMarkerIcon(IconData iconData, Color color, int fontSize) async {
    final pictureRecorder = PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final iconStr = String.fromCharCode(iconData.codePoint);

    textPainter.text = TextSpan(
      text: iconStr,
      style: TextStyle(
        letterSpacing: 0.0,
        fontSize: fontSize.toDouble(),
        fontFamily: iconData.fontFamily,
        color: color,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(0.0, 0.0));

    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(fontSize, fontSize);
    final bytes = await image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: getCurrentCameraPosition(),
              markers: {
                Marker(
                    markerId: const MarkerId("currentLocation"), position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!), icon: clientIcons),
                Marker(
                  markerId: const MarkerId("worker1"),
                  position: const LatLng(6.664306, -1.617526),
                  icon: workersIcons,
                ),
                Marker(
                  markerId: const MarkerId("worker2"),
                  position: const LatLng(6.662790, -1.616323),
                  icon: workersIcons,
                ),
                Marker(
                  markerId: const MarkerId("worker3"),
                  position: const LatLng(6.663254, -1.615457),
                  icon: workersIcons,
                ),
                Marker(
                  markerId: const MarkerId("worker4"),
                  position: const LatLng(6.664910, -1.615981),
                  icon: workersIcons,
                ),
                Marker(
                  markerId: const MarkerId("worker5"),
                  position: const LatLng(6.663866, -1.614393),
                  icon: workersIcons,
                ),
              },
              onMapCreated: (mapController) {
                changeMapMode(mapController);
                _controller.complete(mapController);
              },
              onCameraMove: (position) {
                zoom = position.zoom;
                setState(() {});
              },
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  color: const Color(0xFF7B61FF),
                  width: 6,
                ),
              },
            ),
    );
  }

  //this is the function to load custom map style json
  void changeMapMode(GoogleMapController mapController) {
    getJsonFile("assets/map_styles/standard.json").then((value) => setMapStyle(value, mapController));
  }

  //helper function
  void setMapStyle(String mapStyle, GoogleMapController mapController) {
    mapController.setMapStyle(mapStyle);
  }

  //helper function
  Future<String> getJsonFile(String path) async {
    ByteData byte = await rootBundle.load(path);
    var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
    return utf8.decode(list);
  }
}
