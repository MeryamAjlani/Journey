import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.text})
      : super(key: key);
  final width;
  final height;
  final String text;
  final VoidCallback onPressed;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0,top: 20),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.lightPink,
              disabledBackgroundColor: Color.fromARGB(255, 78, 122, 123)),
          onPressed: widget.onPressed,
          child:  Text(
            widget.text,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
