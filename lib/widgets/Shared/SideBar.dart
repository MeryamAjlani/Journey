import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<bool> _isSelected = [true,false];
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: ColorPalette
              .background //This will change the drawer background to blue.
          //other styles
          ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              decoration: BoxDecoration(
                  color: ColorPalette.background,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/background.jpg'))),
            ),
            Container(
              color: ColorPalette.background,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Calendar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {Navigator.of(context).pushNamed('/calendar'),
                           setState(() {
              for (int index = 0; index < _isSelected.length; index++) {
                if (index == 0) {
                  _isSelected[index] = true;
                } else {
                  _isSelected[index] = false;
                }
              }
            })
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Settings',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {Navigator.of(context).pushNamed('/settings'),
                                    setState(() {
              for (int index = 0; index < _isSelected.length; index++) {
                if (index == 1) {
                  _isSelected[index] = true;
                } else {
                  _isSelected[index] = false;
                }
              }
            })},
                  ),
             
               Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: ColorPalette.pink,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
