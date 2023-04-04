import 'package:flutter/material.dart';

import 'package:my_journey/widgets/TaskTile.dart';

import '../models/Task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        
        child: ExpansionPanelList.radio(
          
          children: tasks
              .map((task) => ExpansionPanelRadio(
                
                  value: task.id,
                  headerBuilder: (context, isExpanded) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Text\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: task.title),
                      const TextSpan(
                        text: '\n\nDescription\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                   
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}