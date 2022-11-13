import 'package:bloc/bloc.dart';

class Todo {
  String id;
  String name;
  String description;
  bool completed;
  Todo(this.id, this.name, this.description, this.completed);
}

class TodoBloc extends Cubit<List<Todo>> {
  TodoBloc() : super([Todo('1', 'One', 'Description of first todo', true)]);

  void addTodo(Todo newTodo) => emit([...state, newTodo]);
}
