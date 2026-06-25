import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> userLogin({
    required String username,
    required String password,
  });

  Future<UserModel> userRefreshToken({
    required String accessToken,
    required String refreshToken,
  });
}
