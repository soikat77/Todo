import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  // referance the box
  final _myBox = Hive.box('myBox');

  // for new user
  void createInitialData() {
    todoList = [
      ['Share this app to my friends', false],
      ['Review this app in PlayStore', false]
    ];
  }

  // load data from database
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  // update data
  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }
}
