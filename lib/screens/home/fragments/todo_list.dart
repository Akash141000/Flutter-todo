import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.model.dart';
import 'package:todo/screens/home/components/todo_list_item.dart';

class TodoListFragment extends StatelessWidget {
  const TodoListFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, List<Todo>>(
      builder: (context, state) => Column(children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.length,
            itemBuilder: ((context, index) => TodoListItem(state[index])),
          ),
        ),
      ]),
    );
  }
}
