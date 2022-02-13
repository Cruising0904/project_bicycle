import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    test();
    super.initState();
  }

  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$data'),
    );
  }

  void test() {
    Map test = Map();
  }
}
