import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String url;
  final String message;
  final int? statusCode;
  final Response? response;

  ApiException({
    required this.url,
    required this.message,
    this.response,
    this.statusCode,
  });

  /// IMPORTANT NOTE
  /// here you can take advantage of toString() method to display the error for user
  /// lets make an example
  /// so in onError method when you make api you can just user apiExceptionInstance.toString() to get the error message from api
  @override
  toString() {
    String result = '';

    // TODO add error message field which is coming from api for you (For ex: response.data['error']['message']
    result += response?.data?['error'] ?? '';

    if(result.isEmpty){
      result += message; // message is the (dio error message) so usualy its not user friendly
    }

    return result;
  }

  handleExceptions(Object error, {String? url, Function(Object)? onError}) {
    if (error is DioException ||
        error is SocketException ||
        error is TimeoutException) {
      handleNetworkRelatedExceptions(error, url, onError);
    } else {
      handleUnexpectedException(onError!, error: error);
    }
  }
  handleNetworkRelatedExceptions(Object error, url, Function(Object)? onError) {
    onError!(error);
  }

  handleUnexpectedException(Function(Object) onError, {required Object error}) {
    onError(error);
  }

}