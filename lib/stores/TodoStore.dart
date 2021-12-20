import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/stores/models/Todo.dart';

class TodoStore extends ChangeNotifier{
  final List<Todo> todosList = [];

  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todosList);

  UnmodifiableListView<Todo> get pendingTodos => UnmodifiableListView(todosList.where((todo)=>!todo.isCompleted));

  UnmodifiableListView<Todo> get completedTodos => UnmodifiableListView(todosList.where((todo) => todo.isCompleted));

  void addTodo(String name){
    final Todo newTodo = new Todo(name:name);
    todosList.add(newTodo);
    notifyListeners();
  }
  
  void deleteTodo(Todo todo) {
    todosList.remove(todo);
    notifyListeners();
  }
  
}