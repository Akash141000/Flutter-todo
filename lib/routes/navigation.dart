import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/main.dart';
import 'package:todo/screens/auth/auth.dart';
import 'package:todo/screens/home/home.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/screens/signup/signup.dart';
import 'package:todo/store/shared_preference.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: authRoute,
      path: authRoute,
      builder: (context, state) {
        return const AuthScreen();
      },
    ),
    GoRoute(
        name: homeRoute,
        path: homeRoute,
        builder: (context, state) {
          if (UserSharedPreferences.authToken != null &&
              UserSharedPreferences.authToken!.isEmpty) {
            return const AuthScreen();
          }
          return HomeScreen();
        }),
    GoRoute(
      name: loginRoute,
      path: loginRoute,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: registerRoute,
      path: registerRoute,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      name: defaultRoute,
      path: defaultRoute,
      builder: (context, state) {
        debugPrint(UserSharedPreferences.authToken);
        if (UserSharedPreferences.authToken != null &&
            UserSharedPreferences.authToken!.isNotEmpty) {
          debugPrint('Authorized');
          return HomeScreen();
        }
        debugPrint('UnAuthorized');
        return const AuthScreen();
      },
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
