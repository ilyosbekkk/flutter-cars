import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiConfig {
  static const String _baseUrl =
      "https://f72166fb-3057-43d7-afe3-869663f9df8f.mock.pstmn.io";

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 25000,
      receiveTimeout: 20000,
      followRedirects: false,
      validateStatus: (status) {
        return status != null && status <= 500;
      },
    ),
  );

  ApiConfig() {
    dio.interceptors.add(
      (InterceptorsWrapper(
        onError: (error, handler) async {
          if (kDebugMode) {
            print('Error Status Code:${error.response?.statusCode}');
          }
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) {
          requestOptions.headers["Accept"] = "application/json";
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
      )),
    );
  }
}
