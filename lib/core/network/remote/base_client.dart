import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../features/auth/domain/entites/user_entity.dart';
import '../../../features/auth/presentation/providers/user_refresh_token_provider.dart';
import '../../init_app.dart';
import 'api_error_handling.dart';
import 'api_interceptor.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
}

class BaseClient {
  Map<String, dynamic>? headers;

  static BaseClient? _instance;

  static const clientIdSecret =
      'Basic NwA0AGYAMQA0AGMANgA5AC0AMgA4ADMAMgAtADQAYgBiADgALQBhAGUAMgAzAC0AMAA4AGQAYgBhADkAZgBjADMAOABiAGIA';

  late Dio? _dio;

  BaseClient._() {
    _dio = Dio();
    _dio!.interceptors.addAll(
      [
        DioInterceptor(dio: _dio!),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      ],
    );
  }

  // Getter for the singleton instance
  static BaseClient get instance {
    // If the instance is null, create a new one
    _instance ??= BaseClient._();
    return _instance!;
  }

  Future<void> getUserAccessToken() async {
    UserEntity? userEntity =
        await getItInstance<UserRefreshTokenProvider>().getUserData();
    headers = {
      "Authorization": "Bearer ${userEntity?.accessToken ?? ''}",
      "tenantId": "1",
    };

    log(userEntity?.accessToken ?? 'NULL', name: "ACCESS TOKEN");
  }

  /// perform safe api request
  safeApiCall(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? queryParameters,
    Function(Response response)? onSuccess,
    Function(Object)? onError,
    Function(int value, int progress)? onReceiveProgress,
    Function(int total, int progress)?
        onSendProgress, // while sending (uploading) progress
    Function? onLoading,
    dynamic data,
    Map<String, dynamic>? optionalHeaders,
  }) async {
    try {
      if (optionalHeaders != null) {
        optionalHeaders.addAll({"tenantId": "1"});
      }
      await getUserAccessToken();
      // 1) indicate loading state
      await onLoading?.call();
      // 2) try to perform http request
      late Response response;
      if (requestType == RequestType.get) {
        response = await _dio!.get(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
              headers: optionalHeaders ?? headers,
              sendTimeout: const Duration(seconds: 60),
              // 60 seconds
              receiveTimeout: const Duration(seconds: 60),
              followRedirects: false,
              validateStatus: (status) => status! < 500),
        );
      } else if (requestType == RequestType.post) {
        response = await _dio!.post(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: optionalHeaders ?? headers),
        );
      } else if (requestType == RequestType.put) {
        response = await _dio!.put(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: optionalHeaders ?? headers),
        );
      } else {
        response = await _dio!.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: optionalHeaders ?? headers),
        );
      }
      // 3) return response (api done successfully)
      await onSuccess!(response);
    } catch (error) {
      handleExceptionsToast(error: error);
      handleExceptions(error, url: url, onError: onError);
    }
  }
}
