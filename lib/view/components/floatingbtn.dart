import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  const FAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(30),
      child: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('이용하기'),
        // icon: Icon(Icons.directions_boat),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
