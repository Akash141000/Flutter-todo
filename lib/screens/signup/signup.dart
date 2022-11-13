import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/main.dart';
import 'package:todo/models/auth.model.dart';

const registerRoute = '/register';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: BlocBuilder<AuthBloc, Auth?>(
        builder: ((context, state) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: double.infinity,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          validator: ((value) {
                            if (value != null && value.isEmpty) {
                              return "Email is required!";
                            }
                            return null;
                          }),
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
                          validator: ((value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return "Password is required!";
                              }
                              if (value.length < 8) {
                                return "Password must be minimum 8 characters";
                              }
                            }
                            return null;
                          }),
                          decoration: const InputDecoration(
                              label: Text('Password'),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 25)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          validator: (confirmPassword) {
                            if (confirmPassword != null) {
                              if (confirmPassword.isEmpty) {
                                return "Confirm Password is required!";
                              }
                              if (confirmPassword !=
                                  confirmPasswordEditingController.value
                                      .toString()) {
                                return "Confirm password must be same as password!";
                              }
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              label: Text('Confirm Password'),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 25)),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              debugPrint('REGISTER');
                              context
                                  .read<AuthBloc>()
                                  .setToken('REGISTER')
                                  .then((value) => GoRouter.of(context)
                                      .pushNamed(defaultRoute));
                            }
                          },
                          child: const Text('SUBMIT'),
                        ),
                      )
                    ]),
              ),
            )),
      ),
    );
  }
}
