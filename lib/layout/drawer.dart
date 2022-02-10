import 'package:flutter/material.dart';

class Side extends StatelessWidget {
  const Side({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      const Padding(
        padding: EdgeInsets.only(top: 40),
      ),
      const ListTile(
        title: Text(
          '로그인 / 회원가입',
          style: TextStyle(fontSize: 24),
        ),
      ),
      ListTile(
        leading: Icon(
          Icons.directions_bike_sharp,
          color: Colors.grey[850],
        ),
        title: const Text('이용기록'),
        onTap: () {
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
          // print('Setting is clicked');
        },
      )
    ]));
  }
}
