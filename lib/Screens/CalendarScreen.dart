// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/Task_bloc/tasks_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Calendar/Calendar.dart';
import 'package:my_journey/widgets/Shared/StyledContainer.dart';
import 'package:my_journey/widgets/Charts/ProgressChartWidget.dart';

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

  @override
  Widget build(BuildContext context) {
    String date = _getDateString();
    SizeConfig sizeConfig = new SizeConfig();
    sizeConfig.init(context);
    final tasks = context.watch<TasksBloc>().state.allTasks;
    final pendingTasks =
        tasks.where((element) => element.isDone == false).toList();
    final completedTasks =
        tasks.where((element) => element.isDone == true).toList();
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: ColorPalette.background,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 15),
            child: Column(
              children: [
                Calendar(),
                // LineChartSample2(),
                  SizedBox(
                  height: 20,
                ),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 25, 4, 40)),
                  child: Column(children: [
                       SizedBox(
                   height: 20,
                 ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth / 10, bottom: 20),
                        child: Text(
                          'My Progress :',
                          style: TextStyle(
                              color: ColorPalette.lightPink,
                              fontSize: 20,
                              fontFamily: 'Pacifico'),
                        ),
                      ),
                    ),
                    pendingTasks.isEmpty && completedTasks.isEmpty
                        ? Container(
                            height: 100,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'No data added to display charts',
                                  style:
                                      TextStyle(color: ColorPalette.lightPink),
                                )),
                          )
                        : ProgressChart(
                            numFinished: completedTasks.length.toDouble(),
                            numUnfinished: pendingTasks.length.toDouble()),
                  ]),
                ),
                
                StyledContainer(
                    title: 'My Tasks',
                    list: pendingTasks,
                    color: ColorPalette.lightPink,
                    imageURL: 'assets/images/Pink Paw.png',
                    emptyMessage: 'No tasks added yet !'),
               
                StyledContainer(title: 'My Completed Tasks', list: completedTasks, color:ColorPalette.lightGreen, imageURL: 'assets/images/Green Paw.png', emptyMessage: 'No completed tasks yet !'),
               
              ],
            ),
          ),
        )),
      );
    });
  }
}
