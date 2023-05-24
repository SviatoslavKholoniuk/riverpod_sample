import 'package:either_option/either_option.dart';

import '../../../../../common/exception/exception.dart';
import '../../model/user.dart';
import '../../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Either<NetworkFailure, User>> call(
    String email,
    String password,
  ) {
    return _authRepository.login(email, password);
  }
}
