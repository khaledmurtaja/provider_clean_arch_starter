import '../../domain/entites/user_entity.dart';
import '../../domain/repos/auth_repository.dart';
import '../data_sources/local/auth_local_data_source.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<UserEntity> userLogin({
    required String username,
    required String password,
  }) async {
    UserModel userModel = await authRemoteDataSource.userLogin(
      username: username,
      password: password,
    );

    UserEntity userEntity = UserModel.toEntity(userModel);

    await authLocalDataSource.saveUserData(userEntity);

    return userEntity;
  }

  @override
  Future<UserEntity?> getUserData() async {
    UserEntity? userEntity = await authLocalDataSource.getUserData();

    return userEntity;
  }

  @override
  Future<UserEntity> userRefreshToken() async {
    UserEntity? savedUserEntity = await getUserData();

    UserModel userModel = await authRemoteDataSource.userRefreshToken(
      accessToken: savedUserEntity!.accessToken,
      refreshToken: savedUserEntity.refreshToken,
    );

    UserEntity userEntity = UserModel.toEntity(userModel);

    await authLocalDataSource.saveUserData(userEntity);

    return userEntity;
  }

  @override
  Future<void> deleteUserData() async {
    await authLocalDataSource.deleteUserData();
  }
}
