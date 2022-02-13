import 'package:bicycle_flutter/layout/appbar.dart';
import 'package:bicycle_flutter/layout/drawer.dart';
import 'package:bicycle_flutter/view/components/floatingbtn.dart';
import 'package:bicycle_flutter/view/googlemap.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const Appbar(),
      drawer: const Side(),
      // floatingActionButton: const FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GMap(),
    );
  }
}
