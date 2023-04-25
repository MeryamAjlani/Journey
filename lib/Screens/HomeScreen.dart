// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:my_journey/Screens/AnalyticsScreen.dart';
import 'package:my_journey/Screens/Budget/BudgetScreen.dart';
import 'package:my_journey/Screens/Budget/HomeBudgetScreen.dart';
import 'package:my_journey/Screens/Budget/MonthlyBudget.dart';
import 'package:my_journey/Screens/CalendarScreen.dart';
import 'package:my_journey/Screens/ConfigureScheduleScreen.dart';
import 'package:my_journey/Screens/NotesScreen.dart';
import 'package:my_journey/Screens/PurchaseListScreen.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/widgets/Calendar/Calendar.dart';
import 'package:my_journey/widgets/Shared/SideBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> headers = [
    'My Calendar',
    'My Todo List',
    'My Budget',
    'My Groceries List'
  ];
  String _header = 'My Calendar';
  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  PageController _pageController = PageController();
  List<Widget> _screens = [
    CalendarScreen(),
    ConfigurationScreen(),
    HomeBudgetScreen(),
    PurchaseListScreen()
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 40, 7, 63),
          title: Text(_header,
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Pacifico')),
        ),
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: _screens,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _selectedIndex = page;
                _header = headers[page];
              });
            }),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 40, 7, 63),
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Budget',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Groceries',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ColorPalette.pink,
          onTap: _onItemTapped,
        ));
  }
}
