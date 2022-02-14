import 'package:bicycle_flutter/func/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future modal() {
  return Get.bottomSheet(
    Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              '만나서 반갑습니다 ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('간편하게 회원가입하고 자전거를 타봅시다 \u{1f60e}',
                style: TextStyle(fontSize: 12)),
            const SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Padding(
              //   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              // ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '회원가입',
                  style: TextStyle(color: Colors.teal),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[100],
                  fixedSize: const Size(170, 50),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  GoogleSignInProvider.to.googleLogin();
                },
                child: const Text('로그인'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[500],
                  fixedSize: const Size(170, 50),
                ),
              )
            ])
          ],
        )),
  );
}
