import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/main.dart';
import 'package:todo/screens/auth/auth.dart';
import 'package:todo/screens/home/home.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/screens/signup/signup.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: authRoute,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: homeRoute,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: loginRoute,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: registerRoute,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: defaultRoute,
      builder: (context, state) => const AuthScreen(),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const Scaffold(
        body: Center(child: Text('ERROR OCCURED!')),
      )),
);
