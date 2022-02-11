import 'package:bicycle_flutter/layout/drawer.dart';
import 'package:bicycle_flutter/layout/appbar.dart';
import 'package:bicycle_flutter/view/googlemap.dart';
import 'package:flutter/material.dart';

import 'package:bicycle_flutter/view/components/floatingbtn.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = mediaquery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Appbar(),
        drawer: Side(),
        floatingActionButton: FAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: GMap());
  }
}
