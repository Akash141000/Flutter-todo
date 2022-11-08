import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.model.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, state) =>
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Text(
                "Total Todos :",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                "${state.length}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                "Pending Todos :",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                "${state.where((e) => !e.completed).length}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                "Completed Todos :",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                "${state.where((e) => e.completed).length}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
