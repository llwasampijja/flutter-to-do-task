import 'package:flutter/material.dart';
import 'package:flutter_to_do/my_tasks_form.dart';

import 'package:flutter_to_do/task_controller.dart';
import 'package:flutter_to_do/task_s.dart';

class TaskManager extends StatefulWidget {
  // final Map listOfTasks;

  // TaskManager(this.listOfTasks);

  @override
  State<StatefulWidget> createState() {
    return _TaskManagerState();
  }
}

class _TaskManagerState extends State<TaskManager> {
  List<Map> _tasks = [
    {'title': 'title1', 'body': 'body1'},
    {'title': 'title11', 'body': 'body11'},
    {'title': 'title111', 'body': 'body111'}
  ];

  // @override
  // void initState() {
  //   _tasks.add(widget.listOfTasks);
  //   super.initState();
  // }

  // @override
  // void didUpdateWidget(TaskManager oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  // }

  void _addTask(Map task) {
    setState(() {
      _tasks.add(task);
      print('_tasks');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: TasksForm(_addTask),
        ),
        Tasks(_tasks)
      ],
    );
  }
}
