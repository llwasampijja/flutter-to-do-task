import 'package:flutter/material.dart';
import 'package:flutter_to_do/my_tasks_form.dart';

import 'package:flutter_to_do/task_controller.dart';
import 'package:flutter_to_do/task_s.dart';
import './tasks_database.dart';
class TaskManager extends StatefulWidget {
  // final Map listOfTasks;

  // TaskManager(this.listOfTasks);

  @override
  State<StatefulWidget> createState() {
    return _TaskManagerState();
  }
}

class _TaskManagerState extends State<TaskManager> {
  List<Map> _tasks = [];

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
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

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
          child: TasksForm(_addTask, titleController, bodyController, _tasks),
        ),
        // Tasks(_tasks)
      ],
    );
  }
}
