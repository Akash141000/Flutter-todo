import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/screens/signup/signup.dart';

const authRoute = '/auth';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => context.push(loginRoute),
                  child: const Text('LOGIN'),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => context.push(registerRoute),
                  child: const Text('REGISTER'),
                ),
              ),
            ],
          )),
    );
  }
}
