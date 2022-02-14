import 'package:bicycle_flutter/func/google_signin.dart';
import 'package:bicycle_flutter/layout/appbar.dart';
import 'package:bicycle_flutter/layout/drawer.dart';
import 'package:bicycle_flutter/view/components/floatingbtn.dart';
import 'package:bicycle_flutter/view/googlemap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appbar.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);
  static late bool? hasData = false;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // final Controller c = Get.put();
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          Home.hasData = snapshot.hasData;
          print('상단에서 Home.hasData : ${Home.hasData}');
          print('상단에서 snapshot.hasData : ${snapshot.hasData}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('wating');
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            print('snapshot = $snapshot');

            //데이터를 들고 있고, 그 상태를 잘 가지고 잇어야 함.
            print('hasData');
            // Get.offAll(() => GMap());
            // navigator?.pop(context);
            // return drawer();

          } else if (snapshot.hasError) {
            // 재시도 해야함.
            print('hasError');
            return const Center(
              child: Text('Something Wnet Wrong'),
            );
          } else {
            // 회원가입 및 로그인 뜨게
            // return SignUpWidget();
            print('not logged in ${GoogleSignInProvider.to.user} ');
            // return drawer();
          }
          print('Home.hasData =  ${Home.hasData}');
          print('sanpshot.hasData =  ${snapshot.hasData}');
          print('스트림 빌더 ');
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: const Appbar(),
            drawer: drawer(),
            floatingActionButton: FAB(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: GMap(),
          );
        });
  }
}
