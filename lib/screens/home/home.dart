import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/screens/home/fragments/create_todo.dart';
import 'package:todo/screens/home/fragments/profile.dart';
import 'package:todo/screens/home/fragments/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  final List<Widget> currentWidget = const [
    CreateTodoFragment(),
    TodoListFragment(),
    ProfileFragment()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
        ),
      ),
      body: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          child: widget.currentWidget[_currentIndex]),
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
