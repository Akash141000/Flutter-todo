import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/utils/utils.dart';

class Auth {
  String? token;
  // String deviceId;
  // String versionNumber;
  // String platform;
  Auth(this.token);
}

class AuthBloc extends Cubit<Auth?> {
  AuthBloc() : super(null);

  void setToken(String? token) async {
    debugPrint('SET TOKEN');
    await UserSharedPreferences.setToken(token);
    emit(Auth(token));
  }

  void removeToken() async {
    await UserSharedPreferences.removeToken();
    emit(null);
  }
}
