import 'package:flutter/material.dart';

class TasksForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return createForm();
  }

  Widget createForm() {
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
                return 'Please enter the title of task';
              }
              return null;
            },
          ),
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Body of task',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter the body of task';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
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