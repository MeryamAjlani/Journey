// ignore_for_file: prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/Task_bloc/tasks_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Alert%20Dialogs/BottomSheetWidget.dart';
import 'package:my_journey/widgets/Shared/EmptyWidget.dart';

import 'dart:math' as math;

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TasksBloc>().state.allTasks;
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => showModalBottomSheet<void>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return BottomSheetWidget();
              },
            ),
            backgroundColor: PurpleColorPalette.accent,
            child: const Icon(Icons.add),
          ),
          backgroundColor: PurpleColorPalette.background,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight / 20),
                    child: tasks.isEmpty
                        ? EmptyWidget(
                            imagePath: "assets/images/Pink Paw.png",
                            message: "No tasks added yet !",
                            color: PurpleColorPalette.highLight2)
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: SizeConfig.screenWidth / 10,
                                    left: SizeConfig.screenWidth / 10),
                                child: Dismissible(
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    context
                                        .read<TasksBloc>()
                                        .add(DeleteTask(task: tasks[index]));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            width: 4.0,
                                            color: tasks[index].isDone!
                                                ? PurpleColorPalette.highLight1
                                                : PurpleColorPalette.accent),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        onTap: () => {
                                          context.read<TasksBloc>().add(
                                              UpdateTask(task: tasks[index]))
                                        },
                                        trailing: tasks[index].isDone!
                                            ? Transform.rotate(
                                                angle: -math.pi / 4,
                                                child: SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: Image.asset(
                                                        'assets/images/Green Paw.png')),
                                              )
                                            : null,
                                        title: Text(
                                          tasks[index].title,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                indent: SizeConfig.screenWidth / 10,
                                endIndent: SizeConfig.screenWidth / 10,
                              );
                            },
                          )),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ignore: camel_case_extensions
extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
