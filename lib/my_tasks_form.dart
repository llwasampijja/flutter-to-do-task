import 'package:flutter/material.dart';
import 'package:flutter_to_do/task_controller.dart';

import './todo_tasks.dart';
import './task_manager.dart';

class TasksForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Function addTaskS;

  TasksForm(this.addTaskS);

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
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Description of the task'),
            validator: (value) {
              if (value.isEmpty){
                return 'Please enter the description of the task';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: (){
                if (_formKey.currentState.validate()){
                  addTaskS({'title':'Adding another task', 'body': 'this is the other task'});
                }
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }

  // Widget createForm(BuildContext context) {
  //   return Form(
  //     key: _formKey,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: <Widget>[
  //         TextFormField(
  //           decoration: const InputDecoration(
  //             hintText: 'Title of task',
  //           ),
  //           validator: (value) {
  //             if (value.isEmpty) {
  //               return 'Please enter the title of task';
  //             }
  //             return null;
  //           },
  //         ),
  //         Flexible(
  //           child: TextFormField(
  //             decoration: const InputDecoration(
  //               hintText: 'Body of task',
  //             ),
  //             validator: (value) {
  //               if (value.isEmpty) {
  //                 return 'Please enter the body of task';
  //               }
  //               return null;
  //             },
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 16.0),
  //           child: RaisedButton(
  //             onPressed: () {
  //               // Validate will return true if the form is valid, or false if
  //               // the form is invalid.
  //               if (_formKey.currentState.validate()) {
  //                 // Process data.
  //                 // Navigator.push(
  //                 //   context,
  //                 //   MaterialPageRoute(builder: (context) => TaskManager()),
  //                 // );
  //                 return TodoTasks();
  //               }
  //             },
  //             child: Text('Save'),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
