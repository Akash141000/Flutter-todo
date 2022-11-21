// ignore_for_file: avoid_print

import 'package:todo/api/client.dart';

class Apis {
  static getTodosAPI() async {
    var response = await ApiClient.dio.get<Map<String, dynamic>>('/getTodos');
    if (response.data?['todoList'] is List) {
      return response.data;
    }
    return {'todoList': []};
  }
}
