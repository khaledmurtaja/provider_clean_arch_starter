
import '../../domain/entites/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> userLogin({
    required String username,
    required String password,
  });

  Future<UserEntity?> getUserData();

  Future<UserEntity> userRefreshToken();

  Future<void> deleteUserData();
}
