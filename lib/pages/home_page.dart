import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // hive box referance
  final _myBox = Hive.box('myBox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // for new user
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _textController = TextEditingController();

  // if checkbox changed
  void handleChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  // create a new task
  addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _textController,
            onSave: saveTask,
            onCancel: () {
              _textController.clear();
              Navigator.of(context).pop();
            },
          );
        });
  }

  // saving the new task
  saveTask() {
    setState(() {
      db.todoList.add([_textController.text, false]);
      _textController.clear();
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            isComplete: db.todoList[index][1],
            onchanged: (value) => handleChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
