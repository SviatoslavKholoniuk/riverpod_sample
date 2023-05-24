import 'package:get_it/get_it.dart';

import '../features/auth/data/di/auth_data_module.dart';
import '../features/auth/domain/di/auth_data_module.dart';
import '../features/auth/presentation/di/auth_presentation_module.dart';
import '../features/splash/presentation/di/splash_presentation_module.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupInjection() async {
  // auth feature
  await setupAuthDataModule();
  await setupAuthDomainModule();
  await setupAuthPresentationModule();

  // home feature ...

  // splash feature ...
  await setupSplashPresentationModule();
}
