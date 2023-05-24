import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../entity/request/login_request.dart';
import '../../entity/response/authorization_response.dart';

part 'auth_service.g.dart';

// TODO move base url to flavours config
@RestApi(baseUrl: 'https://localhost/api/v1/')
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("login")
  Future<AuthorizationResponse> authorize(@Body() LoginRequest body);
}
