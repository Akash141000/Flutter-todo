import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/api/apis.dart';

class Todo {
  String id;
  String name;
  String description;
  bool completed;
  Todo(this.id, this.name, this.description, this.completed);
}

class TodoBloc extends Cubit<List<Todo>> {
  TodoBloc() : super([Todo('1', 'One', 'Description of first todo', true)]) {
    getTodos();
  }

  void addTodo(Todo newTodo) => emit([...state, newTodo]);

  void getTodos() async {
    var response = await getTodosAPI();
    if (kDebugMode) {
      print(response);
    }
    for (var e in List.from(response['todoList'])) {
      addTodo(Todo(e['_id'], e['name'], e['description'], e['completed']));
    }
  }
}
