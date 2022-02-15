import 'package:bicycle_flutter/func/qrscanner.dart';
import 'package:bicycle_flutter/layout/home.dart';
import 'package:bicycle_flutter/view/components/modalbottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class FAB extends StatelessWidget {
  const FAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(30),
      child: FloatingActionButton.extended(
        onPressed: () {
          if (Home.hasData == false) {
            modal();
          } else {
            print('hasData is not null');
            Navigator.of(ctx)
                .push(MaterialPageRoute(builder: (context) => const QRScan()));
            // Get.to(QRScan());
          }
          // GoogleSignInProvider.to.googleLogin();
        },
        label: const Text('이용하기'),
        // icon: Icon(Icons.directions_boat),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
