// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';

class CustomInput extends StatefulWidget {
  const CustomInput(
      {Key? key,
      required this.hintText,
      this.inputFormatters,
      this.validator,
      this.inputType = TextInputType.text})
      : super(key: key);
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = new SizeConfig();
    sizeConfig.init(context);

    return Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.screenHeight / 15,
            right: SizeConfig.screenWidth / 8,
            left: SizeConfig.screenWidth / 8,
            bottom: SizeConfig.screenWidth / 12),
        child: TextFormField(
          keyboardType: widget.inputType,
          style: TextStyle(color: ColorPalette.lightGreen),
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          decoration: InputDecoration(
            label: Text(
              widget.hintText,
              style: TextStyle(color: ColorPalette.lightGreen),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.lightGreen, width: 1.0),
            ),
            border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.lightGreen, width: 1.0),
            ),
            errorStyle: TextStyle(color: ColorPalette.lightPurple),
            errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.lightPurple, width: 1.0),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.lightGreen, width: 1.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.lightBlue, width: 1.0),
            ),
          ),
        ));
  }
}
