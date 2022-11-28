import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homefix/ui/map_ui/map_helpers/load_custom_marker_icon.dart';
import 'package:homefix/ui/map_ui/map_helpers/load_map_style.dart';
import 'package:homefix/ui/map_ui/map_helpers/to_lat_lng.dart';
import 'package:homefix/utils/colors.dart';
import 'package:location/location.dart';

class LocationNotifier {
  ValueNotifier currentLocation = ValueNotifier<LocationData?>(null);
  setCurrentLocation(location) => currentLocation.value = location;
}

class ZoomNotifier {
  ValueNotifier currentZoom = ValueNotifier<double>(17.0);
  setCurrentZoom(zoom) => currentZoom.value = zoom;
}

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor clientIcons = BitmapDescriptor.defaultMarker;
  BitmapDescriptor workersIcons = BitmapDescriptor.defaultMarker;

  LocationNotifier locationNotifier = LocationNotifier();

  // this functions gets and track the current location for the user
  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((location) => locationNotifier.setCurrentLocation(location));

    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLocation) {
        locationNotifier.setCurrentLocation(newLocation);
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: toLatLng(locationNotifier.currentLocation.value),
            ),
          ),
        );
      },
    );
  }

  // this function loads icons which built programmatically
  // loadCustomMarkerIcon is the function that build the icons
  generateIcons() async {
    clientIcons = await loadCustomMarkerIcon(Icons.location_pin, Colors.amber, 128);
    workersIcons = await loadCustomMarkerIcon(Icons.engineering, Colors.black87, 128);
  }

  @override
  void initState() {
    getCurrentLocation();
    generateIcons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: yellow,
          elevation: 0,
          title: const Text("Book Your Service"),
          leading: IconButton(
            icon: const Icon(Icons.menu, size: 32),
            onPressed: () {},
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: locationNotifier.currentLocation,
          builder: (context, currentLocation, child) {
            if (currentLocation == null) return const Center(child: CircularProgressIndicator());

            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: toLatLng(locationNotifier.currentLocation.value),
                zoom: 17.0,
              ),
              markers: {
                // User(service place) marker
                Marker(
                  markerId: const MarkerId("currentLocation"),
                  position: toLatLng(currentLocation),
                  icon: clientIcons,
                ),

                // Workers markers
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
                loadMapStyle(mapController);
                _controller.complete(mapController);
              },

              // this function used to update the map parameters such as, zoom, tilt, ...
              onCameraMove: (position) async {
                GoogleMapController mapController = await _controller.future;
                mapController.animateCamera(CameraUpdate.newCameraPosition(position));
              },
            );
          },
        ),
      ),
    );
  }
}
