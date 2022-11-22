// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:rxdart/subjects.dart';

class ApiClient {
  static late final Dio dio;
  static BehaviorSubject apiErrors = BehaviorSubject();

  ApiClient() {
    BaseOptions options = BaseOptions(
        baseUrl: 'http://127.0.0.1:8080',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          'content-type': 'application/json',
        });
    dio = Dio(options);

    dio.interceptors.add(
        InterceptorsWrapper(onRequest: requestHandler, onError: errorHandler));
  }

  requestHandler(RequestOptions options, RequestInterceptorHandler handler) {
    print("REQUEST >> $options");
    return handler.next(options);
  }

  void responseHandler(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    print("RESPONSE >> $response");
    return handler.next(response);
  }

  errorHandler(DioError error, ErrorInterceptorHandler handler) {
    // apiErrors.add(error.message);
    print("INTERCEPTED ERROR >>> ${error.response}");
    print(error);
    return handler.next(error);
  }
}
