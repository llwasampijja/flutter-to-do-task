import 'package:flutter/material.dart';

class TaskController extends StatelessWidget {
  final Function addTask;

  TaskController(this.addTask);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addTask({'title':'Adding another task', 'body': 'this is the other task'});
        print('this works');
      },
      child: Text('Save'),
    );
  }
}