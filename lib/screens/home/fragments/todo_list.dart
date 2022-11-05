import 'package:flutter/material.dart';
import 'package:todo/models/todo.model.dart';
import 'package:todo/screens/home/components/todo_list_item.dart';

class TodoListFragment extends StatelessWidget {
  const TodoListFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: ((context, index) => TodoBloc.todoList.length > index
              ? TodoListItem(TodoBloc.todoList[index])
              : const Text('null')),
        ),
      ),
    ]);
  }
}
