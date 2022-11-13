import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class Auth {
  String? token;
  // String deviceId;
  // String versionNumber;
  // String platform;
  Auth(this.token);
}

class AuthBloc extends Cubit<Auth> {
  AuthBloc() : super(Auth('LOGIN'));

  void setToken(String? token) {
    debugPrint('SET TOKEN');
    emit(Auth(token));
  }
}
