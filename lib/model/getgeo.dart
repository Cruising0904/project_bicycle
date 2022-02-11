import 'dart:async';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class GetCurPosition extends ChangeNotifier {
  GetCurPosition();
  LatLng? _myLoc;

  LatLng? get myLoc => _myLoc;
  get getCurPosition => _getCurPosition();
  get gpc => _gpc;
  late StreamSubscription<dynamic> _gpc;

  _getCurPosition() async {
    print('getposition');
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _gpc = Location.instance.onLocationChanged.listen((event) {
      print('스트림 ${event.accuracy}');
    });

    // print('stream data $_getCurPosition');

    // var currentPosition = await Geolocator.getCurrentPosition();
    // _myLoc = LatLng(currentPosition.latitude, currentPosition.longitude);
    // print('my curPosition $_myLoc');
  }

  // @override
  // void dispose() {
  //   _getCurPosition.cancel();
  //   super.dispose();
  // }
  void disableStream() {
    print('disable');
    _gpc.cancel();
    // super.dispose();
  }
}
