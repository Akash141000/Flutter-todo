import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/models/auth/auth.model.dart';
import 'package:todo/models/todo/todo.model.dart';
import 'package:todo/screens/login/login.dart';
import '../../../models/auth/auth.bloc.dart';
import '../../../models/todo/todo.bloc.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
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
                child: BlocBuilder<AuthBloc, Auth?>(
                  builder: (context, authState) => ElevatedButton(
                      onPressed: () async {
                        debugPrint('LOGOUT');
                        await context.read<AuthBloc>().removeToken();
                        if (!mounted) {
                          return;
                        }
                        context.go(loginRoute);
                      },
                      child: const Text('LOGOUT')),
                ),
              ),
            ]),
      ),
    );
  }
}
