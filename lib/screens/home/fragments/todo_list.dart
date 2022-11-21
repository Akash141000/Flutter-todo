import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo/todo.model.dart';
import 'package:todo/screens/home/components/todo_list_item.dart';

import '../../../models/todo/todo.bloc.dart';

class TodoListFragment extends StatefulWidget {
  const TodoListFragment({super.key});

  @override
  State<TodoListFragment> createState() => _TodoListFragmentState();
}

class _TodoListFragmentState extends State<TodoListFragment> {
  _TodoListFragmentState();

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
