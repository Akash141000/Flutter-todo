// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:todo/api/client.dart';
import 'package:todo/utils/utils.dart';

class Apis {
  static Future<Map<String, dynamic>> getTodosAPI() async {
    var response = await ApiClient.dio.get<dynamic>('/getTodos');
    return Helper.responseValidator(response);
  }

  static Future<Map<String, dynamic>> loginAPI(
      Map<String, dynamic> postData) async {
    var response = await ApiClient.dio.post('/login', data: postData);
    return Helper.responseValidator(response);
  }

  static Future<Map<String, dynamic>> signupAPI(
      Map<String, dynamic> postData) async {
    var response = await ApiClient.dio.post('/signup', data: postData);
    return Helper.responseValidator(response);
  }
}
