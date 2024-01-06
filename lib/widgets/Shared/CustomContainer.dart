import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer({
    Key? key,
    required this.title,
    required this.widget,
  }) : super(key: key);

  final String title;
  Widget widget;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 25, 4, 40)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth / 10, bottom: 20),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: PurpleColorPalette.highLight2,
                      fontSize: 20,
                      fontFamily: 'Pacifico'),
                ),
              ),
            ),
            widget.widget
          ]),
        ),
      ),
    );
  }
}
