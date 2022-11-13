import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static String? authToken;
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    await getToken();
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
  }
}
