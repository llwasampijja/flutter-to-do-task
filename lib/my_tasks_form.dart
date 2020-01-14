import 'package:flutter/material.dart';
import 'package:flutter_to_do/task_controller.dart';

import './todo_tasks.dart';
import './task_manager.dart';
import './tasks_database.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class TasksForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Function addTaskS;
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final List<Map> listOfTasks;

  TasksForm(this.addTaskS, this.titleController, this.bodyController,
      this.listOfTasks);

  // TasksForm.textFieldsControllers();

  @override
  Widget build(BuildContext context) {
    return createForm(context);
  }

  Widget createForm(BuildContext buildContext) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Title of task',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter the title of the task';
              }
              return null;
            },
            controller: titleController,
          ),
          TextFormField(
            decoration:
                const InputDecoration(hintText: 'Description of the task'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter the description of the task';
              }
              return null;
            },
            controller: bodyController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  try {
                    var randomId = new Random();
                    var item = TasksToDo(
                        id: randomId.nextInt(100),
                        title: titleController.text,
                        body: bodyController.text);
                    await TasksDatabase.db.insertTask(item);
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: 'Note not saved',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }

                  addTaskS({
                    'title': titleController.text,
                    'body': bodyController.text
                  });
                  Navigator.push(
                    buildContext,
                    MaterialPageRoute(
                        builder: (context) => TodoTasks(listOfTasks)),
                  );
                }
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
