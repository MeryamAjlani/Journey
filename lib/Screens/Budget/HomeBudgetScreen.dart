// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/Blocs/budget_bloc/budget_bloc.dart';
import 'package:my_journey/Screens/Budget/BudgetScreen.dart';
import 'package:my_journey/Screens/Budget/MonthlyBudget.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/ToggleMenu.dart';

class HomeBudgetScreen extends StatefulWidget {
  const HomeBudgetScreen({Key? key}) : super(key: key);

  @override
  State<HomeBudgetScreen> createState() => _HomeBudgetScreenState();
}

class _HomeBudgetScreenState extends State<HomeBudgetScreen> {
  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  PageController _pageController = PageController();
  List<Widget> _screens = [BudgetScreen(), MonthlyBudgetScreen()];

  int _selectedIndex = 0;
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PurpleColorPalette.background,
        title: Container(
          child: Center(
            child: ToggleButtons(
              focusColor: Colors.transparent,
              fillColor: Colors.transparent,
              isSelected: isSelected,
              onPressed: (int index) {
                _onItemTapped(index);
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              children: <Widget>[
                Container(
                  width: SizeConfig.screenWidth / 3,
                  decoration: isSelected[0]
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 2.0, color: PurpleColorPalette.accent),
                          ),
                        )
                      : null,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Text('Daily ',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth / 3,
                  decoration: isSelected[1]
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 2.0, color: PurpleColorPalette.accent),
                          ),
                        )
                      : null,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Text('Monthly ',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: _screens,
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              _selectedIndex = page;
            });
          }),
    );
  }
}
