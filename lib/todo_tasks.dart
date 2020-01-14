import 'package:flutter/material.dart';

class TodoTasks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyTodoTasks();
  }
}

class _MyTodoTasks extends State <TodoTasks>{
  List <Widget> _listOfTasks = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of tasks'),
        ),
        // body: Column(
        //   children:_listOfTasks
        //   .map((taskBody) => Card(
        //       child: Column(
        //         children: <Widget>[
        //           // Text(taskTitle),
        //           Text(taskBody),
        //         ],

        //       ),body: Column(
        //   children:_listOfTasks
        //   .map((taskBody) => Card(
        //       child: Column(
        //         children: <Widget>[
        //           // Text(taskTitle),
        //           Text(taskBody),
        //         ],

        //       ),
        //       ),
        // ),
        //       ),
        // ),
      ),
    );
  }

}