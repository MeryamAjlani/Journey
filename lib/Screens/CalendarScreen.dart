// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Calendar/Accordion.dart';
import 'package:my_journey/widgets/Calendar/Calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  String _getDateString() {
    List months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    DateTime now = new DateTime.now();
    var mon = now.month;

    String day = now.day.toString();
    String year = now.year.toString();
    String result = "${months[mon + 1]} , ${day}  ${year}";
    return result;
  }

  final int _finishedCount = 5;
  final int _unfinishedCount = 9;

  @override
  Widget build(BuildContext context) {
    String date = _getDateString();
    List<String> tasks = ['taaaaaa','taaaaaaaaaaa',"taaaaa"];
    SizeConfig sizeConfig = new SizeConfig();
    sizeConfig.init(context);
    return Scaffold(
      backgroundColor: ColorPalette.background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight / 15,
                  horizontal: SizeConfig.screenWidth / 15),
              child: Calendar(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.screenWidth / 10,
                    bottom: 20
                    ),
                child: Text(
                  'My Tasks :',
                  style: TextStyle(color: ColorPalette.lightGreen, fontSize: 20,fontFamily: 'Pacifico'),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: SizeConfig.screenWidth / 10,
                          left: SizeConfig.screenWidth / 10,
                          ),
                      child: Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          // Step 2
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                        child: Container(
                          height:60,
                          decoration: BoxDecoration(
                              border: Border(left: BorderSide(width: 4.0, color: ColorPalette.lightGreen),),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("jriheuoghul",style: TextStyle(color: Colors.white,fontSize: 17,
                            
                              ),)),)
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
