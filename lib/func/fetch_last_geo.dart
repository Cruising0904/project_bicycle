import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LastGeo {
  static late SharedPreferences _preferences;
  static late final double lat;
  static late final double lon;
  static late LatLng lastPosition;
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    lat = _preferences.getDouble('lat') ?? 0;
    lon = _preferences.getDouble('lon') ?? 0;
    print('lastgeo $lat, $lon');
  }
}
