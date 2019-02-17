import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
GoogleMapController mapController;

var location = new Location();
void main() {
  //var currentLocation = <String, double>{};
 // currentLocation= await _getStartingLocation();
  LatLng _center = const LatLng(45.521563,-122.677433);

  runApp(new MaterialApp(
    title: "Magicarp",
    home: GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),

  )
  )
  );
  }

Future<Map<String, double>> _getStartingLocation() async {
  var currentLocation = <String, double>{};
  try {
    currentLocation = (await location.getLocation) as Map<String, double>;
  }catch (e){
    currentLocation = null;
  }
  return currentLocation;
}
void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}