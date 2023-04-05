// ignore_for_file: prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/Task_bloc/tasks_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/BottomSheetWidget.dart';
import 'package:my_journey/widgets/EmptyWidget.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet<void>(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),),
          context: context,
           isScrollControlled: true,
          builder: (BuildContext context) {
            return BottomSheetWidget();
          },
        ),
        backgroundColor: ColorPalette.lightPink,
        child: const Icon(Icons.add),
      ),
      backgroundColor: ColorPalette.background,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight / 20),
            child: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                var tasks = state.pendingTasks;
                if (tasks.isEmpty)
                  return EmptyWidget(
                      imagePath: "assets/images/Pink Paw.png",
                      message: "No tasks added yet !",
                      color: ColorPalette.lightPink);
                else
                  return ListView.builder(
                        shrinkWrap: true,
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: 10,
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
                                    border: Border.all(
                                        color: ColorPalette.lightPink),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: ColorPalette.lightPink,
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: ColorPalette.lightGreen,
                                        ),
                                      ],
                                    ),
                                    title: Text(
                                      tasks[index].title,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                  ;
              },
            )),
      ),
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
