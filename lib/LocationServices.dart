import 'package:location/location.dart';
class LocationServices {
  Map<String,double>CurrentLocation () {
    var currentLocation = <String, double>{};
    var location = new Location();
    try{
      currentLocation = ( location.getLocation) as Map<String, double>;
    }
    catch (e) {
      currentLocation = null;
    }
    return currentLocation;

  }
}