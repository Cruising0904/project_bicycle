import 'package:bicycle_flutter/layout/home.dart';
import 'package:bicycle_flutter/test/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:bicycle_flutter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        //   body: HomePage(),
        // ),
        );
  }
}
