import 'package:dio/dio.dart';

import '../../local/auth_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.source);

  final AuthLocalDataSource source;

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await source.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
