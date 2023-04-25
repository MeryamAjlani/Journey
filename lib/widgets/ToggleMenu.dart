// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';

class ToggleMenu extends StatefulWidget {
  const ToggleMenu({Key? key}) : super(key: key);

  @override
  State<ToggleMenu> createState() => _ToggleMenuState();
}

class _ToggleMenuState extends State<ToggleMenu> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return AppBar(
     title: Container(
        width: SizeConfig.screenWidth,
        color: Colors.transparent,
        child: ToggleButtons(
          isSelected: isSelected,
          selectedColor: ColorPalette.pink,
          color: Colors.white,
          fillColor: Colors.transparent,
          renderBorder: false,
          //splashColor: Colors.red,
          highlightColor: ColorPalette.pink,
          children: <Widget>[
            Container(
              width: SizeConfig.screenWidth / 2,
              decoration: isSelected[0]
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2.0, color: ColorPalette.pink),
                      ),
                    )
                  : null,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Text('Daily Expenses', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth / 2,
              decoration: isSelected[1]
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2.0, color: ColorPalette.pink),
                      ),
                    )
                  : null,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Text('Monthly Expenses', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
          onPressed: (int newIndex) {
            setState(() {
              for (int index = 0; index < isSelected.length; index++) {
                if (index == newIndex) {
                  isSelected[index] = true;
                } else {
                  isSelected[index] = false;
                }
              }
            });
          },
        ),
      ),
    );
  }
}
