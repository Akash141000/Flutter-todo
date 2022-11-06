import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.model.dart';
import 'package:todo/screens/home/components/todo_list_item.dart';

class TodoListFragment extends StatelessWidget {
  const TodoListFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: BlocBuilder<TodoBloc, List<Todo>>(
          builder: (context, state) => ListView.builder(
            shrinkWrap: true,
            itemCount: state.length,
            itemBuilder: ((context, index) => TodoListItem(state[index])),
          ),
        ),
      ),
    ]);
  }
}
