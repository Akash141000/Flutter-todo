import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/api/client.dart';

class UserSharedPreferences {
  static String? authToken;
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    String authToken = await getToken();
    ApiClient.dio.options.headers[HttpHeaders.authorizationHeader] = authToken;
  }

  static Future setToken(String? token) async {
    if (_preferences == null || token == null) {
      return;
    }
    authToken = token;
    await _preferences!.setString('token', token);
    return;
  }

  static Future getToken() async {
    if (_preferences == null) {
      return;
    }
    authToken = _preferences!.getString('token');
    return authToken;
  }

  static Future removeToken() async {
    debugPrint('REMOVE TOKEN');

    if (_preferences == null) {
      return;
    }
    _preferences!.remove('token');
    authToken = null;
    return;
  }
}
