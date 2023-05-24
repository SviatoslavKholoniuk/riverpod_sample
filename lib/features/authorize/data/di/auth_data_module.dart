import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../common/injector.dart';
import '../../domain/repository/auth_repository.dart';
import '../local/auth_local_data_source.dart';
import '../remote/api/auth_remote_data_source.dart';
import '../remote/interceptors/auth_interceptor.dart';
import '../remote/service/auth_service.dart';
import '../repository/auth_repository_impl.dart';
import 'dio.dart';

Future<void> setupAuthDataModule() async {
  // dio config
  getIt.registerLazySingleton(() => createDioWithLogging(getIt()));

  // interceptors
  getIt.registerLazySingleton(() => AuthInterceptor(getIt()));

  // services
  getIt.registerLazySingleton(() => AuthService(getIt()));

  // remote data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt()));

  // local data source
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(getIt()));

  // repository
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt(), getIt()));
}
