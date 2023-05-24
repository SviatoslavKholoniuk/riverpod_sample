import 'package:either_option/either_option.dart';

import '../../../../../common/exception/exception.dart';
import '../../entity/request/login_request.dart';
import '../../entity/response/authorization_response.dart';
import '../service/auth_service.dart';

abstract class AuthRemoteDataSource {
  Future<Either<NetworkFailure, AuthorizationResponse>> login(
    String email,
    String password,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthService _service;

  AuthRemoteDataSourceImpl(this._service);

  @override
  Future<Either<NetworkFailure, AuthorizationResponse>> login(
    String email,
    String password,
  ) {
    return catchNetwork(
      () => _service.authorize(LoginRequest(
        email: email,
        password: password,
      )),
    );
  }
}
