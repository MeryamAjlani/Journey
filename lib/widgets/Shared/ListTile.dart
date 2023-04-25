// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_journey/constants/ColorPalette.dart';

class ListTile extends StatefulWidget {
  const ListTile({Key? key}) : super(key: key);

  @override
  State<ListTile> createState() => _ListTileState();
}

class _ListTileState extends State<ListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 4.0, color: ColorPalette.lightGreen),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          //onTap: () => {},
        //  leading: Icon(
          //  Icons.lightbulb,
          //  color: ColorPalette.lightGreen,
          //  size: 25,
        //  ),
          //trailing: tasks[index].isDone!
          // ? Transform.rotate(
          //   angle: -math.pi / 4,
          //  child: SizedBox(
          //     height: 30,
          //    width: 30,
          //   child: Image.asset(
          //       'assets/images/Green Paw.png')),
          // )
          //  : null,
        //  title: Text(
            // tasks[index].title,
          //  "Electricity",
          //  style: const TextStyle(color: Colors.white),
           // textAlign: TextAlign.left,
        //  ),
        ),
      ),
    );
  }
}
