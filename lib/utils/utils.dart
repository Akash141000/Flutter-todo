// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiError extends Error {
  late String message;
  ApiError(DioError error) {
    if (error.response != null) {
      message = jsonDecode(error.response.toString())['message'];
    } else {
      message = error.message;
    }
  }
}

class Helper {
  static Map<String, dynamic> responseValidator(Response response) {
    return response.data;
  }
}
