import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/home/fragments/create_todo.dart';
import 'package:todo/screens/home/fragments/profile.dart';
import 'package:todo/screens/home/fragments/todo_list.dart';

import '../../api/client.dart';
import '../../models/todo/todo.bloc.dart';

const homeRoute = '/home';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  final List<Widget> currentWidget = [
    const CreateTodoFragment(),
    const TodoListFragment(),
    const ProfileFragment()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  final GlobalKey<ScaffoldMessengerState> _snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    ApiClient.apiErrors.listen((value) {
      debugPrint(_snackbarKey.currentState.toString());
      _snackbarKey.currentState!
          .showSnackBar(const SnackBar(content: Text('Error')));
    });
  }

  void changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _snackbarKey,
      appBar: AppBar(
        title: const Text(
          'Todo List',
        ),
      ),
      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: BlocProvider(
            create: (_) => TodoBloc()..getTodos(),
            child: widget.currentWidget[_currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile')
        ],
        currentIndex: _currentIndex,
        onTap: changeScreen,
      ),
    );
  }
}
