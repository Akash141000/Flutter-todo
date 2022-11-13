import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/auth.model.dart';

const loginRoute = '/login';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<AuthBloc, Auth>(
          builder: ((context, authState) =>
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('LOGIN');
                      context.read<AuthBloc>().setToken('LOGIN');
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text('SUBMIT'),
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
