import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key,required this.title}) : super(key: key,);
    final String title;
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
       preferredSize: const Size.fromHeight(100),
      child: AppBar());
  }
}