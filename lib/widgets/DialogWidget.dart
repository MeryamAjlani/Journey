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
  TextEditingController titleController = TextEditingController();

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorPalette.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: const Text('Add Task', style: TextStyle(color:ColorPalette.lightPink),),
      content:    Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextFormField(
              controller: titleController,
          style: TextStyle(color: Color.fromARGB(255, 237, 216, 241)),
          
          decoration: InputDecoration(
            label: Text(
           'Task title',
              style: TextStyle(color: ColorPalette.lightGreen),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.lightGreen, width: 1.0),
            ),
            border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.lightGreen, width: 1.0),
            ),
            errorStyle: TextStyle(color: ColorPalette.lightPink),
            errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.lightPink, width: 1.0),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.lightGreen, width: 1.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.lightPink, width: 1.0),
            ),
          ),
        )
          ),
      
        ],
      ),
    ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel', style: TextStyle(color:ColorPalette.lightPink)),
        ),
        TextButton(
         onPressed: () {
                    var task = Task(
                        id: '3',
                        title: titleController.text,
                        date: DateTime.now().toString());
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
          child: const Text('Add', style: TextStyle(color:ColorPalette.lightPink)),
        ),
      ],
    );
  }
}
