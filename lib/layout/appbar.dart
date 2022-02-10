import 'package:flutter/material.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
      title: const Text("자전거를 타자"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
