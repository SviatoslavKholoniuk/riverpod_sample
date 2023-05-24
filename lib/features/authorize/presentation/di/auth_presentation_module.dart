import 'package:riverpod_flutter/common/injector.dart';
import 'package:riverpod_flutter/features/authorize/presentation/ui/login/provider/login_notifier.dart';

Future<void> setupAuthPresentationModule() async {
  getIt.registerFactory(() => LoginNotifier(getIt()));
}
