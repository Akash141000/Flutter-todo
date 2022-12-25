import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/routes/routes.path.dart';
import 'package:todo/screens/auth/auth.dart';
import 'package:todo/routes/shell.routes.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/screens/signup/signup.dart';
import 'package:todo/store/shared_preference.dart';

import '../screens/home/home.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state) {
    const nonGuardedRouted = [loginRoute, registerRoute, authRoute];
    var authToken = UserSharedPreferences.authToken;
    if (!nonGuardedRouted.contains(state.subloc) && authToken == null ||
        (authToken != null && authToken.isEmpty)) {
      return loginRoute;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: createRoutePath(auth),
      name: auth,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: createRoutePath(login),
      name: login,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: createRoutePath(register),
      name: register,
      builder: (context, state) => SignUpScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        // debugPrint("SHELL>> ${state.location} ${state.subloc}");
        return HomeScreen(
          child: child,
        );
      },
      routes: homeShellRoutes, //shell router
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const Scaffold(
        body: Center(
            child: Text(
          'Error Occured!',
          style: TextStyle(color: Colors.red),
        )),
      )),
);
