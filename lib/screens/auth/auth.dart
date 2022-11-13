import 'package:flutter/material.dart';
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
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, loginRoute),
                  child: const Text('LOGIN'),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, registerRoute),
                  child: const Text('REGISTER'),
                ),
              ),
            ],
          )),
    );
  }
}
