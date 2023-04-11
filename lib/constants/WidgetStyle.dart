import 'package:flutter/material.dart';
import 'package:my_journey/constants/ColorPalette.dart';

class WidgetStyle {
  static InputDecoration getInputDecoration(String title) {
    return InputDecoration(
      label: Text(
        title,
        style: const TextStyle(color: ColorPalette.lightPink),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorPalette.lightPink, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorPalette.lightPink, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorStyle: const TextStyle(color: ColorPalette.lightPink),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorPalette.lightPink, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorPalette.lightPink, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorPalette.lightPink, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  static ButtonStyle getButtonStyle(Color buttonColor) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      )),
      backgroundColor: MaterialStatePropertyAll<Color>(buttonColor),
    );
  }
}
