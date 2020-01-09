import 'package:flutter/material.dart';
import './my_tasks_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Set up Flutter'),
        ),
        body: Card(
          child: TasksForm(),
        ),
      ),
    );
  }
}
