import 'package:flutter/material.dart';
import 'package:todo/screens/home/components/add_todo_form.dart';

class CreateTodoFragment extends StatelessWidget {
  const CreateTodoFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: const [AddTodo()],
            )
          ],
        ));
  }
}
