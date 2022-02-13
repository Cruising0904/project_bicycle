// import 'dart:async';
// import 'package:get/get.dart';

// import 'package:location/location.dart';

// class GetCurPosition extends GetxController {
//   var latitude;
//   var longitude;
//   var m2 = <String, double>{};

//   late StreamSubscription<dynamic> _gpc;

//   StreamSubscription<dynamic> get gpc => _gpc;

//   getCurPosition() async {
//     print('getposition');

//     _gpc = Location.instance.onLocationChanged.listen((data) {
//       latitude = data.latitude.obs;
//       longitude = data.longitude.obs;
//       update();
//     });
//   }

//   void disableStream() {
//     print('disable');
//     _gpc.cancel();
//   }

//   @override
//   void dispose() {
//     _gpc.cancel();
//     super.dispose();
//   }
// }
