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
  @override
  Widget build(BuildContext context) {
    return Theme(
       data: Theme.of(context).copyWith(
                 canvasColor: ColorPalette.background //This will change the drawer background to blue.
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
              child: Expanded(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.calendar_month,color: Colors.white,),
                      title: const Text('Calendar',style: TextStyle(color: Colors.white),),
                      onTap: () => {},
                    ),
                  ListTile(
                      leading: const Icon(Icons.settings,color: Colors.white,),
                      title: const Text('Settings',style: TextStyle(color: Colors.white),),
                      onTap: () => {},
                    ),
                 ListTile(
                      leading: const Icon(Icons.color_lens,color: Colors.white,),
                      title: const Text('Theme',style: TextStyle(color: Colors.white),),
                      onTap: () => {},
                    ),
                  ],
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
