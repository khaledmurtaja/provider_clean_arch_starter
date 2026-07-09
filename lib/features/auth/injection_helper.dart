import '../../core/init_app.dart';
import '../../core/shared_use_cases/delete_user_data_use_case.dart';
import '../../core/shared_use_cases/get_user_data_use_case.dart';
import 'data/data_sources/local/auth_local_data_source.dart';
import 'data/data_sources/remote/auth_remote_data_source.dart';
import 'data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repos/auth_repository.dart';
import 'domain/use_cases/user_login_use_case.dart';
import 'domain/use_cases/user_refresh_token_use_case.dart';
import 'presentation/providers/user_login_provider.dart';
import 'presentation/providers/user_refresh_token_provider.dart';


Future<void> initAuthFeature() async {
  // PROVIDERS
  getItInstance.registerFactory(
        () => UserLoginProvider(
      userLoginUseCase: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
        () => UserRefreshTokenProvider(
      userRefreshTokenUseCase: getItInstance(),
      getUserDataUseCase: getItInstance(),
      deleteUserDataUseCase: getItInstance(),
    ),
  );

  // USE CASES
  getItInstance.registerLazySingleton(
        () => UserLoginUseCase(authRepository: getItInstance()),
  );

  getItInstance.registerLazySingleton(
        () => UserRefreshTokenUseCase(authRepository: getItInstance()),
  );

  getItInstance.registerLazySingleton(
        () => GetUserDataUseCase(authRepository: getItInstance()),
  );

  getItInstance.registerLazySingleton(
        () => DeleteUserDataUseCase(authRepository: getItInstance()),
  );

  // REPOSITORIES
  getItInstance.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      authRemoteDataSource: getItInstance(),
      authLocalDataSource: getItInstance(),
    ),
  );

  // DATA SOURCES
  getItInstance.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(),
  );

  getItInstance.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSource(),
  );
}
