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
    SizeConfig sizeConfig = new SizeConfig();
    sizeConfig.init(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 4, 62),
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
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "My Progress :",
                    style:
                        TextStyle(color: ColorPalette.lightBlue, fontSize: 20),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight / 60,
                  horizontal: SizeConfig.screenWidth / 15),
              child: LinearPercentIndicator(
                barRadius: Radius.circular(20),
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: _finishedCount / (_finishedCount + _unfinishedCount),
                center: Text(
                    (_finishedCount * 100 / (_finishedCount + _unfinishedCount))
                            .round()
                            .toString() +
                        "%"),
                progressColor: ColorPalette.lightBlue,
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight / 60,
                    horizontal: SizeConfig.screenWidth / 15),
                child: AccordionWidget(
                    title: 'Finished',
                    data: ['nyaaaa', 'nyaaaa', 'nyaaaa', 'nyaaaa', 'nyaaaa'],
                    color: ColorPalette.lightGreen)),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight / 60,
                  horizontal: SizeConfig.screenWidth / 15),
              child: SizedBox(
                  child: AccordionWidget(
                      title: 'Unfinished',
                      data: ['nyaaaa', 'nyaaaa', 'nyaaaa', 'nyaaaa', 'nyaaaa'],
                      color: ColorPalette.pink)),
            ),
         

            Padding(
              padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight / 50,
                    horizontal: SizeConfig.screenWidth / 15),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorPalette.lightGreen),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 20, bottom: 20.0),
                  child:  Column(
                    children: [
                         Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.screenHeight / 70),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "My Budget:",
                    style:
                        TextStyle(color: ColorPalette.lightBlue, fontSize: 20),
                  )),
            ),
                      SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Text(
                            "Money Spent",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('45274 ' + '\$',
                              style: TextStyle(color: Colors.white))
                        ])),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
