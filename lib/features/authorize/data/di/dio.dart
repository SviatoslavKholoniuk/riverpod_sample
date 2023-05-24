import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../remote/interceptors/auth_interceptor.dart';

Dio createDioWithLogging(AuthInterceptor interceptor) {
  final dio = Dio();

  if (!kReleaseMode) {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  dio.interceptors.add(interceptor);

  return dio;
}
