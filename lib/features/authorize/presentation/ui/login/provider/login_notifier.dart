import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/common/validators/email_validator.dart';
import 'package:riverpod_flutter/features/authorize/domain/model/user.dart';

import '../../../../../../common/common_failure_mapper.dart';
import '../../../../../../common/injector.dart';
import '../../../../../../common/utils/event.dart';
import '../../../../domain/usecases/auth/login_usecase.dart';
import 'login_state.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
        (ref) => getIt<LoginNotifier>());

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase _loginUseCase;
  final CommonFailureMapper _failureMapper = CommonFailureMapper();

  LoginNotifier(
    this._loginUseCase,
  ) : super(LoginState.initial());

  void emailChanged(String email) async {
    state = state.copyWith(
      email: email,
      canContinue: (state.password?.length ?? 0) >= 10 &&
          EmailValidator.validate(email) == null,
    );
  }

  void passwordChanged(String password) async {
    state = state.copyWith(
      password: password,
      canContinue:
          password.length >= 10 && EmailValidator.validate(state.email) == null,
    );
  }

  void login() async {
    if (state.email == null || state.password == null) return;
    final result = await _loginUseCase(state.email!, state.password!);
    result.fold(
      (error) => {
        state = state.copyWith(error: Event(_failureMapper(error).message)),
      },
      (user) => state = state.copyWith(success: Event(user)),
    );
  }
}
