import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/WidgetStyle.dart';
import 'package:my_journey/widgets/Shared/ShakeStateWidget.dart';
import 'package:my_journey/widgets/Shared/ShakeWidget.dart';

class CustomShakeWidget extends StatefulWidget {
  CustomShakeWidget(
      {Key? key,
      required this.formKey,
      this.icon,
      required this.title,
      required this.controller,
      this.keyboardType})
      : super(key: key);

  final GlobalKey<ShakeWidgetState> formKey;
  TextInputType? keyboardType;
  IconData? icon;
  final TextEditingController controller;
  final String title;

  @override
  State<CustomShakeWidget> createState() => _CustomShakeWidgetState();
}

class _CustomShakeWidgetState extends State<CustomShakeWidget> {
  @override
  Widget build(BuildContext context) {
    return ShakeWidget(
        key: widget.formKey,
        shakeCount: 3,
        shakeOffset: 10,
        shakeDuration: const Duration(milliseconds: 500),
        child: TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            style: const TextStyle(color: Color.fromARGB(255, 237, 216, 241)),
            decoration: WidgetStyle.getInputDecoration(widget.title,icon: widget.icon)));
  }
}
