import 'dart:async';

import 'package:bicycle_flutter/func/fetch_last_geo.dart';
import 'package:bicycle_flutter/view/components/map/markers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GMap extends StatefulWidget {
  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> with WidgetsBindingObserver {
  // late final SharedPreferences prefs;

  double _lat = LastGeo.lat;
  double _lon = LastGeo.lon;
  GoogleMapController? _controller;
  bool enableStream = true;
  late StreamSubscription<LocationData> lcs;
  Location currentLocation = Location();

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    // print(markers);

    setState(() {
      getLocation();
    });
  }

  void pauseStream() {
    print('puase');
    lcs.pause();
  }

  void resumeStream() {
    print('resume');
    lcs.resume();
  }

  @override
  void dispose() {
    lcs.cancel();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) return;

    final isBackground = state == AppLifecycleState.paused;

    if (isBackground) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble('lat', _lat);
      prefs.setDouble('lon', _lon);
      print('bakc $_lat');
    }
  }

  var location;
  void getLocation() async {
    lcs = currentLocation.onLocationChanged.listen((LocationData loc) {
      _lat = loc.latitude!;
      _lon = loc.longitude!;
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? _lat, loc.longitude ?? _lon),
        zoom: 17.0,
      )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: <Widget>[
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(_lat, _lon),
              zoom: 17.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            markers: getBikeMarkers(),
          ),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             // GetBuilder<GetCurPosition>(
          //             //   builder: (_) {
          //             //     return Text(
          //             //         "Current Geo Value : lat: ${_.latitude}, lon: ${_.longitude}");
          //             //   },
          //             // )
          //           ],
          //         ),
          //       ),
          //     ]),
          Positioned(
            bottom: 100,
            right: 10,
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 249, 245, 1),
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(10),
                  //     topRight: Radius.circular(10),
                  //     bottomLeft: Radius.circular(10),
                  //     bottomRight: Radius.circular(10)
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: IconButton(
                    onPressed: () async {
                      setState(() {
                        enableStream = !enableStream;
                      });
                      if (enableStream) {
                        print('enable');
                        resumeStream();
                      } else {
                        print('disable');
                        pauseStream();
                      }
                    },
                    icon: Icon(
                      Icons.gps_fixed,
                      color: enableStream ? Colors.blue : Colors.grey,
                    ))),
          )
        ]));
  }

  Set<Marker> getBikeMarkers() {
    print('getMarker=');
    // print(MarkerData.to);
    try {
      setState(() {
        markers = MarkerData.to;
        print(markers);
      });
    } catch (e) {
      print('데이터 넣을ㄸ 에러 $e');
    }

    return markers.toSet();
  }
}
