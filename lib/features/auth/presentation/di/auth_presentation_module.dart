import 'package:riverpod_flutter/common/injector.dart';

import '../ui/login/provider/login_notifier.dart';

Future<void> setupAuthPresentationModule() async {
  getIt.registerFactory(() => LoginNotifier(getIt()));
}
