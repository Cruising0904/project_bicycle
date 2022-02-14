// import 'dart:js_util';

import 'package:bicycle_flutter/func/google_signin.dart';
import 'package:bicycle_flutter/layout/home.dart';
import 'package:bicycle_flutter/view/components/modalbottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  // const DrawerWidget({ Key? key }) : super(key: key);
  final RxController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget drawer() {
  late final user = FirebaseAuth.instance.currentUser;
  return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
    const Padding(
      padding: EdgeInsets.only(top: 40),
    ),
    if (Home.hasData == false)
      ListTile(
        onTap: () {
          Get.snackbar('dataChanged', 'hasData is false');
        },
        title: const Text('로그인 / 회원가입 ', style: TextStyle(fontSize: 24)),
      )
    else
      InkWell(
        onTap: () => {GoogleSignInProvider.to.logout()},
        child: Column(children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),
          Text('${user.displayName}님'),
          Text('반갑습니다.'),
        ]
            // Text('로그인 됨 ${user?.displayName}'),
            ),
      ),
    ListTile(
      leading: Icon(
        Icons.directions_bike_sharp,
        color: Colors.grey[850],
      ),
      title: const Text('이용기록'),
      onTap: () {
        print(user.runtimeType);
        // print('Home is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.question_mark,
        color: Colors.grey[850],
      ),
      title: const Text('Q&A'),
      onTap: () {
        // ignore: avoid_print
        print('Q&A is clicked');
      },
    ),
    ListTile(
      leading: Icon(
        Icons.settings,
        color: Colors.grey[850],
      ),
      title: const Text('설정'),
      onTap: () {
        GoogleSignInProvider.to.logout();
        // print('Setting is clicked');
      },
    )
  ]));
}
