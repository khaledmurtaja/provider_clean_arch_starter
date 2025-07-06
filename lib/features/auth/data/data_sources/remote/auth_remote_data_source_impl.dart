
import '../../../../../core/network/remote/api_end_points.dart';
import '../../../../../core/network/remote/base_client.dart';
import '../../models/user_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> userLogin({
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> response = {};

    await BaseClient.instance.safeApiCall(
      '$authUrl$loginEndPoint',
      RequestType.post,
      optionalHeaders: {'Authorization': BaseClient.clientIdSecret},
      data: {
        'username': username,
        'password': password,
      },
      onSuccess: (data) {
        response = data.data;
      },
    );

    if (response.isEmpty) {
      throw Exception('Failed to fetch user data.');
    }

    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> userRefreshToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    Map<String, dynamic> response = {};

    await BaseClient.instance.safeApiCall(
      '$authUrl$userRefreshTokenEndPoint',
      RequestType.post,
      optionalHeaders: {'Authorization': BaseClient.clientIdSecret},
      queryParameters: {'refresh_token': refreshToken},
      data: {
        'access_token': accessToken,
        'refresh_token': refreshToken,
      },
      onSuccess: (data) {
        response = data.data;
      },
    );

    if (response.isEmpty) {
      throw Exception('Failed to fetch user data after refresh token.');
    }

    return UserModel.fromJson(response);
  }
}
