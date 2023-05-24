import '../../../../common/injector.dart';
import '../usecases/auth/login_usecase.dart';

Future<void> setupAuthDomainModule() async {
  // use cases
  getIt.registerFactory(() => LoginUseCase(getIt()));
}
