import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo/api/apis.dart';
import 'package:todo/store/shared_preference.dart';
import 'package:todo/utils/utils.dart';

import 'auth.model.dart';

class AuthBloc extends Cubit<Auth?> {
  static final authBlocInstance = AuthBloc();
  AuthBloc() : super(null);

  Future<dynamic> login(Map<String, String> userCredentials) async {
    try {
      var token = await Apis.loginAPI(userCredentials);
      if (token is String) {
        await UserSharedPreferences.setToken(token);
        emit(Auth(token));
      }
      return;
    } on DioError catch (error) {
      throw ApiError(error);
    }
  }

  Future<dynamic> signup(Map<String, String> userCredentials) async {
    try {
      var token = await Apis.signupAPI(userCredentials);
      if (token is String) {
        await UserSharedPreferences.setToken(token);
        emit(Auth(token));
      }
      return;
    } on DioError catch (error) {
      throw ApiError(error);
    }
  }

  Future<void> removeToken() async {
    debugPrint('REMOVE TOKEN');
    await UserSharedPreferences.removeToken();
    emit(null);
    return;
  }
}
