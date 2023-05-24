import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/injector.dart';
import '../../../../auth/domain/repository/auth_repository.dart';
import 'splash_state.dart';

final splashNotifier =
    StateNotifierProvider.autoDispose<SplashNotifier, SplashState?>(
  (ref) => getIt<SplashNotifier>(),
);

class SplashNotifier extends StateNotifier<SplashState?> {
  final AuthRepository _authRepository;

  SplashNotifier(this._authRepository) : super(null) {
    _init();
  }

  _init() async {
    var isAuthorized = await _authRepository.isLoggedIn();

    // add delay for splash logo
    await Future.delayed(const Duration(seconds: 1));

    if (isAuthorized) {
      state = SplashState.authenticated;
    } else {
      state = SplashState.unauthenticated;
    }
  }
}
