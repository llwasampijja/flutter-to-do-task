import 'package:flutter/material.dart';

import './task_s.dart';
import './tasks_database.dart';

class TodoTasks extends StatefulWidget {
  final List<Map> myList;

  TodoTasks(this.myList);

  @override
  State<StatefulWidget> createState() {
    return _MyTodoTasks(myList);
  }
}

class _MyTodoTasks extends State<TodoTasks> {
  // List<Widget> _listOfTasks = [];
  final List<Map> _myList;

  _MyTodoTasks(this._myList);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of tasks'),
        ),
        body: FutureBuilder<List<TasksToDo>>(
          future: TasksDatabase.db.tasksList(),
          builder: (BuildContext builderContext,
              AsyncSnapshot<List<TasksToDo>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  TasksToDo item = snapshot.data[index];
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            subtitle: Text(item.body,
                                style: TextStyle(fontSize: 25.0)),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
