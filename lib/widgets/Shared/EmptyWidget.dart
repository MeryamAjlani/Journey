import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';

class EmptyWidget extends StatefulWidget {
  const EmptyWidget(
      {Key? key,
      required this.imagePath,
      required this.message,
      required this.color})
      : super(key: key);
  final String imagePath;
  final String message;
  final Color color;

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
            height: SizeConfig.screenHeight / 10,
            width: SizeConfig.screenWidth / 5,
            child: Image.asset(widget.imagePath)),
        Center(
          child: Text(
            widget.message,
            style: TextStyle(color: widget.color),
          ),
        )
      ]),
    );
  }
}
