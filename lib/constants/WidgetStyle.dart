import 'package:flutter/material.dart';
import 'package:my_journey/constants/ColorPalette.dart';

class WidgetStyle {
  static InputDecoration getInputDecoration(String title, {IconData? icon}) {
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: PurpleColorPalette.highLight2,
      ),
      label: Text(
        title,
        style: const TextStyle(color: PurpleColorPalette.highLight2),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: PurpleColorPalette.highLight2, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(color: PurpleColorPalette.highLight2, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorStyle: const TextStyle(color: PurpleColorPalette.highLight2),
      errorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: PurpleColorPalette.highLight2, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: PurpleColorPalette.highLight2, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: PurpleColorPalette.highLight2, width: 1.0),
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
