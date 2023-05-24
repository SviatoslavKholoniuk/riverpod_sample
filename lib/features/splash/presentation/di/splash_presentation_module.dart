import '../../../../common/injector.dart';
import '../ui/provider/splash_notifier.dart';

Future<void> setupSplashPresentationModule() async {
  getIt.registerFactory(() => SplashNotifier(getIt()));
}
