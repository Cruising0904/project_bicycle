import 'package:bicycle_flutter/func/fire_auth.dart';
import 'package:bicycle_flutter/func/firebata.dart';
import 'package:bicycle_flutter/func/google_signin.dart';
import 'package:bicycle_flutter/layout/home.dart';
import 'package:bicycle_flutter/test/test.dart';
import 'package:bicycle_flutter/view/components/map/markers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'func/fetch_last_geo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LastGeo.init();
  await MarkerData.init();
  await Firebase.initializeApp();
  await FireData.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (BuildContext context) => GoogleSignInProvider(),
        child: GetMaterialApp(
          title: 'bicycle',
          theme: ThemeData(
            fontFamily: 'CookieRun',
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          // home: FutureBuilder(
          //     future: _fbApp,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasError) {
          //         print('error: ${snapshot.error.toString()}');
          //         return const Text('Something went wrong');
          //       } else if (snapshot.hasData) {
          //         print('firebase work? ${snapshot.data}');
          //         return const
          //       } else {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }
          //     })
          home: Home(),
        ),
      );
}
