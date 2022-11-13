import 'package:flutter/material.dart';

const registerRoute = '/register';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              decoration: const InputDecoration(
                label: Text('Email'),
                contentPadding: EdgeInsets.symmetric(vertical: 25),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                  label: Text('Password'),
                  contentPadding: EdgeInsets.symmetric(vertical: 25)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                  label: Text('Confirm Password'),
                  contentPadding: EdgeInsets.symmetric(vertical: 25)),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () => debugPrint('LOGIN'),
              child: const Text('SUBMIT'),
            ),
          )
        ]),
      ),
    );
  }
}
