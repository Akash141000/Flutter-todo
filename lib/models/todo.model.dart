import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class Todo {
  String id;
  String name;
  String description;
  bool completed;
  Todo(this.id, this.name, this.description, this.completed);
}

class TodoBloc extends Cubit<List<Todo>> {
  TodoBloc() : super([Todo('1', 'One', 'Description of first todo', false)]);

  void addTodo(Todo newTodo) => emit([...state, newTodo]);
}
