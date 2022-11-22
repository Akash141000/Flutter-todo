import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/api/apis.dart';
import 'package:todo/store/shared_preference.dart';

import 'auth.model.dart';

class AuthBloc extends Cubit<Auth?> {
  static final authBlocInstance = AuthBloc();
  AuthBloc() : super(null);

  Future<void> login(Map<String, String> userCredentials) async {
    debugPrint('SET TOKEN');
    try {
      var token = await Apis.loginAPI(userCredentials);
      if (token is String) {
        await UserSharedPreferences.setToken(token);
        emit(Auth(token));
      }
      return;
    } catch (error) {
      debugPrint("Login Api Error>> $error");
    }
  }

  Future<void> signup(Map<String, String> userCredentials) async {
    debugPrint('SET TOKEN');
    try {
      var token = await Apis.signupAPI(userCredentials);
      if (token is String) {
        await UserSharedPreferences.setToken(token);
        emit(Auth(token));
      }
      return;
    } catch (error) {
      debugPrint("SignUp Api Error>> $error");
    }
  }

  Future<void> removeToken() async {
    debugPrint('REMOVE TOKEN');
    await UserSharedPreferences.removeToken();
    emit(null);
    return;
  }
}
