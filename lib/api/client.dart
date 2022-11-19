import 'package:dio/dio.dart';

class ApiClient {
  static late final Dio dio;

  ApiClient() {
    BaseOptions options = BaseOptions(
        baseUrl: 'http://127.0.0.1:8080',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          'content-type': 'application/json',
        });
    dio = Dio(options);
  }
}
