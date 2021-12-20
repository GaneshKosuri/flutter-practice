import 'package:flutter/cupertino.dart';

class Todo{
  bool isCompleted;
  String name;

  Todo({@required this.name, this.isCompleted = false});

  void updateTodoStatus() {
    isCompleted = !isCompleted;
  }

  void updateTodoName(String updatedName) {
    name = updatedName;
  }

}