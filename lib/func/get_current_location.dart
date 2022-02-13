// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class GetCurrentLocation extends StatefulWidget {
//   const GetCurrentLocation({Key? key}) : super(key: key);

//   @override
//   _GetCurrentLocationState createState() => _GetCurrentLocationState();
// }

// class _GetCurrentLocationState extends State<GetCurrentLocation> {
//   @override
//   void initState() {
//     super.initState();
//     print('class');
//     getPosition();
//   }

//   Future<void> getPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     var currentPosition = await Geolocator.getCurrentPosition();
//     var lastPosition = await Geolocator.getLastKnownPosition();
//     print('lastPosition $lastPosition');
//     print('currentPosition $currentPosition');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
