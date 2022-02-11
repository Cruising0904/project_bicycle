// import ‘package:flutter/services.dart’ show rootBundle;
// import ‘dart:ui’ as ui;
// import 'dart:typed_data';
import 'package:bicycle_flutter/func/firebata.dart';
// import 'package:bicycle_flutter/func/get_current_location.dart';
import 'package:bicycle_flutter/model/getgeo.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

// Future<Uint8List> getBytesFromAsset({String path,int width})async {
// ByteData data = await rootBundle.load(path);
// ui.Codec codec = await ui.instantiateImageCodec(
//    data.buffer.asUint8List(),
//    targetWidth: width
//  );
// ui.FrameInfo fi = await codec.getNextFrame();
// return (await fi.image.toByteData(
//    format: ui.ImageByteFormat.png))
//  .buffer.asUint8List();
// }

// Marker demo= new Marker(
// markerId: MarkerId(“marker_id”),
// infoWindow: InfoWindow(title:_currentAddress),
// );

class GMap extends StatefulWidget {
  const GMap({Key? key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  late GoogleMapController mapController; //contrller for Google map
  LatLng? curPosition = LatLng(27.7089427, 85.3086209);
// FutuerProvider<LatLng>() {

// }
  final GetCurPosition gcp = GetCurPosition();

  @override
  void initState() {
    gcp.getCurPosition;
  }

  final Set<Marker> markers = {}; //markers for google map

  bool enableStream = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      GoogleMap(
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: curPosition!, //initial position
          zoom: 15.0, //initial zoom level
        ),
        // myLocationButtonEnabled: true,
        // myLocationEnabled: true,
        zoomControlsEnabled: false,

        // markers: getmarkers(), //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                child: null,
              )
              // child: Text('gps data Lat: ${LatLng}')),
            ],
          )
        ],
      ),
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
                onPressed: () {
                  // initialPosition;
                  setState(() {
                    enableStream = !enableStream;
                  });
                  if (enableStream) {
                    print('stream');
                    gcp.getCurPosition;
                  } else {
                    // GetCurrentLocation;
                    // getPosition().then((value) => print(value));
                    print('stop');
                    gcp.disableStream();
                  }
                  // positionStream;
                  // retrieve();
                },
                icon: Icon(
                  Icons.gps_fixed,
                  color: enableStream ? Colors.blue : Colors.grey,
                ))),
      )
    ]);
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(curPosition.toString()),
        position: curPosition!, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}
