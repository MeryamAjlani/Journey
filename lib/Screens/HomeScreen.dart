// ignore_for_file: prefer_final_fields, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/Screens/AnalyticsScreen.dart';
import 'package:my_journey/Screens/BudgetScreen.dart';
import 'package:my_journey/Screens/CalendarScreen.dart';
import 'package:my_journey/Screens/ConfigureScheduleScreen.dart';
import 'package:my_journey/Screens/NotesScreen.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/widgets/Calendar/Calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
  PageController _pageController = PageController();
  List<Widget> _screens = [CalendarScreen(), BudgetScreen(), ConfigurationScreen()];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> tasks = [];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 18, 89),
          leading: const Icon(Icons.arrow_back),
          title: Text('Calendar',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        body: PageView(
            children: _screens,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _selectedIndex = page;
              });
            }),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 2, 18, 89),
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Budget',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: 'Today',
            ),
          
            
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ColorPalette.lightGreen,
          onTap: _onItemTapped,
        ));
  }
}
