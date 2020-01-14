import 'package:flutter/material.dart';
import './my_tasks_form.dart';
import './task_manager.dart';
import './tasks_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // List listFromDFb = 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.cyan,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('To-Do Tasks'),
        ),
        body: TaskManager(),
      ),
    );
  }
}
