// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/Task_bloc/tasks_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/models/Task.dart';
import 'package:my_journey/widgets/InputWidget.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

final _formKey = GlobalKey<FormState>();


class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorPalette.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: const Text(
        'Add Task',
        style: TextStyle(color: ColorPalette.lightPink),
      ),
     
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel',
              style: TextStyle(color: ColorPalette.lightPink)),
        ),
        
      ],
    );
  }
}
