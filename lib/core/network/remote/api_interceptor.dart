// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:dio/dio.dart';

import '../../../features/auth/presentation/providers/user_refresh_token_provider.dart';
import '../../init_app.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;
  DioInterceptor({required this.dio});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        await getItInstance<UserRefreshTokenProvider>().userRefreshToken();
        handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        handler.next(e);
      }
      return;
    }
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {
      await getItInstance<UserRefreshTokenProvider>().userRefreshToken();
      handler.resolve(await _retry(response.requestOptions));
      return;
    }
    handler.next(response);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    await getItInstance<UserRefreshTokenProvider>().getUserData();

    final options = Options(
      method: requestOptions.method,
      headers: {
        "Authorization":
            "Bearer ${getItInstance<UserRefreshTokenProvider>().userEntity!.accessToken}",
      },
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
