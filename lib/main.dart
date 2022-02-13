import 'package:bicycle_flutter/layout/home.dart';
import 'package:bicycle_flutter/test/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'func/fetch_last_geo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
    await LastGeo.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  static final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'bicycle',
        theme: ThemeData(
          fontFamily: 'CookieRun',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('error: ${snapshot.error.toString()}');
                return const Text('Something went wrong');
              } else if (snapshot.hasData) {
                print('firebase work? ${snapshot.data}');
                return const Home();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        // home: Scaffold(
        //   body: Test(),
        // ),
        );
  }
}
