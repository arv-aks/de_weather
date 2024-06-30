// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package

import 'package:dio/dio.dart';

class ApiProvider {
  static final Dio _dio = Dio(BaseOptions(
    headers: {
      'Cache-Control': 'no-cache',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    // Added timeout related errors handling on ui
    connectTimeout: const Duration(seconds: 90),
    sendTimeout: const Duration(seconds: 90),
    receiveTimeout: const Duration(seconds: 90),
  ));

  static Dio getDio() {
    return _dio;
  }
}
