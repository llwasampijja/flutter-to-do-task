import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TasksDatabase {
  Future<Database> get database async {
    // if (_database != null) return _database;

    // if _database is null we instantiate it
    // _database = await initializeDatabase();
    return await initializeDatabase();
  }

  initializeDatabase() async {
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'tasks_to_do_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, body TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertTask(TasksToDo taskToDo) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'tasks',
      taskToDo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

class TasksToDo {
  final int id;
  final String title;
  final int body;

  TasksToDo({this.id, this.title, this.body});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $title, age: $body}';
  }
}
