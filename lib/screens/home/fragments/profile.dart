import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/main.dart';
import 'package:todo/models/auth.model.dart';
import 'package:todo/models/todo.model.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, blocState) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Total Todos :",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${blocState.length}",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Pending Todos :",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${blocState.where((e) => !e.completed).length}",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Completed Todos :",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${blocState.where((e) => e.completed).length}",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: BlocBuilder<AuthBloc, Auth>(
                  builder: (context, authState) => ElevatedButton(
                      onPressed: () {
                        debugPrint('LOGOUT');
                        context.read<AuthBloc>().setToken(null);
                        Navigator.pushReplacementNamed(
                          context,
                          defaultRoute,
                        );
                      },
                      child: const Text('LOGOUT')),
                ),
              ),
            ]),
      ),
    );
  }
}
