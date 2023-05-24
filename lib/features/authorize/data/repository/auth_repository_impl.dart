import 'package:either_option/either_option.dart';

import '../../../../common/exception/exception.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../entity/response/authorization_response.dart';
import '../local/auth_local_data_source.dart';
import '../remote/api/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authLocalDataSource, this._authRemoteDataSource);

  @override
  Future<Either<NetworkFailure, User>> login(
    String email,
    String password,
  ) async {
    var response = await _authRemoteDataSource.login(email, password);

    return response.fold((failure) => Left(failure), (result) async {
      await _saveUserToken(result);
      return Right(User(result.name));
    });
  }

  Future<void> _saveUserToken(AuthorizationResponse response) async {
    await _authLocalDataSource.saveToken(response.authorizationToken.token);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await _authLocalDataSource.getAccessToken() != null;
  }
}
