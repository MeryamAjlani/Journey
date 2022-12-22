import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      this._selectedIndex = index;
    });

    initState() {
      _selectedIndex = widget.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 2, 18, 89),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule,
              color:
                  _selectedIndex == 0 ? ColorPalette.lightBlue : Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border,
              color:
                  _selectedIndex == 1 ? ColorPalette.lightBlue : Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month,
              color:
                  _selectedIndex == 2 ? ColorPalette.lightBlue : Colors.white),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedLabelStyle: TextStyle(color: Colors.white),
      selectedItemColor: ColorPalette.lightBlue,
      onTap: _onItemTapped,
    );
  }
}
