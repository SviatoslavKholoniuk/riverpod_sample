import 'package:either_option/either_option.dart';

import '../../../../common/exception/exception.dart';
import '../model/user.dart';

abstract class AuthRepository {
  Future<Either<NetworkFailure, User>> login(String email, String password);

  Future<bool> isLoggedIn();
}
