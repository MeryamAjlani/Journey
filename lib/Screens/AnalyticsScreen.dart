// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/ProgressChartWidget.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    List finishedTasks = [
      "Feed Caramel",
      "Feed Caramel",
      "Feed Caramel",
    ];
      List unfinishedTasks = [
      "Feed Caramel",
      "Feed Caramel",
      "Feed Caramel",
    ];
    SizeConfig sizeConfig = new SizeConfig();
    sizeConfig.init(context);
    return Scaffold(
       
        backgroundColor: ColorPalette.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               
                  Padding(
                    padding:  EdgeInsets.only(left: SizeConfig.screenWidth/8, bottom: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Finished Tasks",
                          style: TextStyle(color: ColorPalette.lightGreen)),
                    ),
                  ),
                  SizedBox(
                    height: (SizeConfig.screenHeight / 16) * finishedTasks.length,
                    child: Container(
                      width: SizeConfig.screenWidth * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorPalette.lightGreen),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          itemCount: finishedTasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              child: Row(children: [
                                Icon(
                                  Icons.check,
                                  color: ColorPalette.lightGreen,
                                ),
                                Text(
                                  ' ${finishedTasks[index]}',
                                  style: TextStyle(color: ColorPalette.pink),
                                )
                              ]),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding:
                         EdgeInsets.only(left: SizeConfig.screenWidth/8, bottom: 20, top: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Unfinished Tasks",
                          style: TextStyle(color: ColorPalette.lightPink)),
                    ),
                  ),
                  SizedBox(
                    height: (SizeConfig.screenHeight / 16) * unfinishedTasks.length,
                    child: Container(
                      width: SizeConfig.screenWidth * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorPalette.lightPink),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          itemCount: unfinishedTasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              child: Row(children: [
                                Icon(Icons.cancel,
                                    color: ColorPalette.lightPink),
                                Text(
                                  ' ${unfinishedTasks[index]}',
                                  style: TextStyle(color: ColorPalette.pink),
                                )
                              ]),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding:
                         EdgeInsets.only(left: SizeConfig.screenWidth/8, bottom: 20, top: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("How was Your day?",
                          style: TextStyle(color: ColorPalette.lightPink)),
                    ),
                  ),
                  Center(
                    child: RatingBar.readOnly(
                      alignment: Alignment.center,
                      size: 50,
                      filledIcon: Icons.favorite,
                      filledColor: ColorPalette.purple,
                      emptyColor: ColorPalette.pink,
                      emptyIcon: Icons.heart_broken,
                      initialRating: 4,
                      maxRating: 5,
                    ),
                  ),
                  Padding(
                    padding:
                         EdgeInsets.only(left: SizeConfig.screenWidth/8, bottom: 20, top: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Your Thoughts",
                          style: TextStyle(color: ColorPalette.pink)),
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      margin: EdgeInsets.only(bottom: SizeConfig.screenHeight/20),
                      width: SizeConfig.screenWidth * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorPalette.pink),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 20, bottom: 20.0),
                        child: Text(
                          'I fed caramel , petted caramel , shpowered caramel , but most importantly , loved caramel a lot',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
