import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'LocationServices.dart';

class Mapui extends StatefulWidget{
  Mapui(Map mp){
    current_loc = mp;
  }
  var current_loc = <String, double>{};
  @override
  _MapuiState createState() => _MapuiState(current_loc);
}
class _MapuiState extends State<Mapui>{
  _MapuiState(Map mp){
    current_loc = mp;
    _center =   LatLng(current_loc["latitude"],current_loc["longitude"]);
  }

  GoogleMapController mapController;
  var current_loc = <String, double>{};
  LatLng _center ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Magicarp"),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


}