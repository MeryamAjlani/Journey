// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/Task_bloc/tasks_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/models/Task.dart';
import 'package:uuid/uuid.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

TextEditingController titleController = TextEditingController();

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
      var uuid = Uuid();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Container(
        decoration: const BoxDecoration(color: ColorPalette.background,
         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        
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
                      child: TextFormField(
                        controller: titleController,
                        style:
                            TextStyle(color: Color.fromARGB(255, 237, 216, 241)),
                        decoration: InputDecoration(
                          label: Text(
                            'Task title',
                            style: TextStyle(color: ColorPalette.lightPink),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorPalette.lightPink, width: 1.0),
                                 borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorPalette.lightPink, width: 1.0),
                                 borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorStyle: TextStyle(color: ColorPalette.lightPink),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorPalette.lightPink, width: 1.0),
                                 borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorPalette.lightPink, width: 1.0),
                                 borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorPalette.lightPink, width: 1.0),
                                 borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )),
                  ButtonTheme(
                    height: 100,
                    child: TextButton(
                      style: ButtonStyle( backgroundColor: MaterialStatePropertyAll<Color>(ColorPalette.pink),
                      
                      ),
                      onPressed: () {
                        var task = Task(
                            id: uuid.v4(),
                            title: titleController.text,
                            date: DateTime.now().toString());
                        context.read<TasksBloc>().add(AddTask(task: task));
                        Navigator.pop(context);
                        titleController.text = '';
                      },
                      child: const Text('Add',
                          style: TextStyle(color: Colors.white)),
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
