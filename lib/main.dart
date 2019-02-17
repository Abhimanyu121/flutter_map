import 'package:flutter/material.dart';
import 'map_ui.dart';
import 'LocationServices.dart';

void main()  {
  var current_loc = <String, double>{};
  //current_loc = await getloc();
  print(getloc());
  current_loc = {"latitude":42.152, "longitude":12.65};
  runApp(Mapui(current_loc));
}
Map<String,double> getloc()  {
  LocationServices ls = new LocationServices();
  return ls.CurrentLocation();
}