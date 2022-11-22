// ignore_for_file: avoid_print

import 'package:todo/api/client.dart';

class Apis {
  static getTodosAPI() async {
    var response = await ApiClient.dio.get<Map<String, dynamic>>('/getTodos');
    return response;
  }

  static loginAPI(Map<String, dynamic> postData) async {
    var response = await ApiClient.dio.post('/login', data: postData);
    return response;
  }

  static signupAPI(Map<String, dynamic> postData) async {
    var response = await ApiClient.dio.post('/signup', data: postData);
    return response;
  }
}
