import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../common/utils/event.dart';
import '../../../../domain/model/user.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool canContinue,
    Event<String>? error,
    Event<User>? success,
    String? email,
    String? password,
    @Default(false) bool isLoading,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState();
}
