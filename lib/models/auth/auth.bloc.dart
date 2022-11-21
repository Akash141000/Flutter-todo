import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/store/shared_preference.dart';

import 'auth.model.dart';

class AuthBloc extends Cubit<Auth?> {
  AuthBloc() : super(null);

  Future<void> setToken(String? token) async {
    debugPrint('SET TOKEN');
    await UserSharedPreferences.setToken(token);
    emit(Auth(token));
    return;
  }

  Future<void> removeToken() async {
    debugPrint('REMOVE TOKEN');
    await UserSharedPreferences.removeToken();
    emit(null);
    return;
  }
}