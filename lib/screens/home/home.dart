import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/routes/routes.path.dart';

import '../../api/client.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;
  HomeScreen({required this.child, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void changeScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(createRoutePath(todoItemShell));
        break;
      case 1:
        context.go(createRoutePath(""));
        break;
      case 2:
        context.go(createRoutePath(profileShell));
        break;
      default:
        context.go(createRoutePath(""));
    }
  }

  int getCurrentIndex(BuildContext context) {
    debugPrint(GoRouter.of(context).location);
    switch (GoRouter.of(context).location) {
      case "/$todoItemShell":
        return 0;
      case "/":
        return 1;
      case "/$profileShell":
        return 2;
      default:
        return 1;
    }
  }

  @override
  void initState() {
    //debugPrint("HOME SCREEN");
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiClient.apiErrors.listen((value) => {
            if (mounted)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value),
                  ),
                ),
              }
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: getCurrentIndex(context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile')
        ],
        onTap: ((value) => changeScreen(value, context)),
      ),
    );
  }
}
