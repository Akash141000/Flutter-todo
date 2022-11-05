class Todo {
  String id;
  String name;
  String description;
  bool completed;
  Todo(this.id, this.name, this.description, this.completed);
}

class TodoBloc {
  static List<Todo> todoList = [
    Todo('1', 'One', 'Description of first todo', false),
    Todo('2', 'Two', 'Description of second todo', true)
  ];
}
