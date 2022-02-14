import 'package:bicycle_flutter/func/google_signin.dart';
import 'package:bicycle_flutter/layout/home.dart';
import 'package:bicycle_flutter/view/components/modalbottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
