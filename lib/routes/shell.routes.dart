import 'package:go_router/go_router.dart';
import 'package:todo/routes/routes.path.dart';
import '../screens/home/fragments/create_todo.dart';
import '../screens/home/fragments/profile.dart';
import '../screens/home/fragments/todo_list.dart';

final homeShellRoutes = [
  GoRoute(
    path: createRoutePath(todoItemShell),
    name: todoItemShell,
    pageBuilder: (context, state) {
      // debugPrint("TODO ITEM>>");
      return NoTransitionPage(
          child: CreateTodoFragment(
        key: state.pageKey,
      ));
    },
  ),
  GoRoute(
    path: createRoutePath(profileShell),
    name: profileShell,
    pageBuilder: (context, state) {
      // debugPrint("PROFILE>>");
      return NoTransitionPage(
          child: ProfileFragment(
        key: state.pageKey,
      ));
    },
  ),
  GoRoute(
    path: createRoutePath(""),
    name: todoListShell,
    pageBuilder: (context, state) {
      // debugPrint("TODO LIST>>");
      return NoTransitionPage(
          child: TodoListFragment(
        key: state.pageKey,
      ));
    },
  ),
];
