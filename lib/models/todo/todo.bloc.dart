import 'package:bloc/bloc.dart';
import 'package:todo/api/apis.dart';
import 'package:todo/models/todo/todo.model.dart';

class TodoBloc extends Cubit<List<Todo>> {
  static final todoBlocInstance = TodoBloc();
  TodoBloc() : super([]);

  void addTodo(Todo newTodo) => emit([...state, newTodo]);

  Future<void> getTodos() async {
    var response = await Apis.getTodosAPI();
    var data = response["data"];
    for (var todo in List.from(data['todoList'])) {
      addTodo(Todo(
          todo['_id'], todo['name'], todo['description'], todo['completed']));
    }
    return;
  }

  Future<void> clearTodos() async {
    emit([]);
    return;
  }
}
