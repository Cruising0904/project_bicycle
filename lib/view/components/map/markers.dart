import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerData extends GetxController {
  static late Set<Marker> _markers = {};
  static get to => _markers;
  static late BitmapDescriptor icon;
  static Future init() async {
    // try {
    //   icon = await
    // } catch (e) {
    //   print('iconError =  $e');
    // }
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(12, 12)), 'assets/cycle.png')
        .then((value) => icon = value);
  }

  static setBikeMarkers(Map bikesData) async {
    bikesData.forEach((key, value) {
      // print(value['uuid']);
      // print(value['latitude']);
      print('루프데이터 $icon');
      final marker = Marker(
          markerId: MarkerId(key),
          // icon: icon,
          infoWindow: InfoWindow(title: value['uuid']),
          position: LatLng(value['latitude'], value['longitude']));
      _markers.add(marker);
    });
    print('Set 데이터 $_markers');
    // return _markers.toSet();
  }

  // print(marers);
}
