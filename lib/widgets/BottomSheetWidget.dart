// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/Task_bloc/tasks_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/constants/WidgetStyle.dart';
import 'package:my_journey/models/Task.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/ShakeStateWidget.dart';
import 'package:my_journey/widgets/ShakeWidget.dart';
import 'package:uuid/uuid.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController titleController = TextEditingController();
  bool _isTextFieldError = false;
  final _textFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();
  @override
  Widget build(BuildContext context) {
    var uuid = Uuid();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Container(
        decoration: const BoxDecoration(
            color: ColorPalette.background,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Add Task',
                      style: TextStyle(color: ColorPalette.lightPink),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ShakeWidget(
                        key: _textFieldErrorShakeKey,
                        shakeCount: 3,
                        shakeOffset: 10,
                        shakeDuration: Duration(milliseconds: 500),
                        child: TextFormField(
                          controller: titleController,
                          style: TextStyle(
                              color: Color.fromARGB(255, 237, 216, 241)),
                          decoration: WidgetStyle.getInputDecoration('Task Title')
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: TextButton(
                            style: WidgetStyle.getButtonStyle(ColorPalette.purple),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: TextButton(
                            style: WidgetStyle.getButtonStyle(ColorPalette.pink),
                            onPressed: () {
                            
                              setState(() {
                                _isTextFieldError =
                                    (titleController.text.isEmpty);
                              });
                              if (!_isTextFieldError) {
                                var task = Task(
                                    id: uuid.v4(),
                                    title: titleController.text,
                                    date: DateTime.now().toString());
                                context
                                    .read<TasksBloc>()
                                    .add(AddTask(task: task));
                                Navigator.pop(context);
                                titleController.text = '';
                              } else {
                                _textFieldErrorShakeKey.currentState
                                    ?.shakeWidget();
                              }
                            },
                            child: const Text('Add',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
