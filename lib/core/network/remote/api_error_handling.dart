import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:toastification/toastification.dart';

import '../../utils/widgets/custom_toast.dart';

void handleExceptions(Object error, {String? url, Function(Object)? onError}) {
  if (error is DioException ||
      error is SocketException ||
      error is TimeoutException) {
    handleNetworkRelatedExceptions(error, url, onError);
  } else {
    if (onError != null) {
      handleUnexpectedException(onError, error: error);
    } else {
      log('Unhandled exception: $error');
    }
  }
}

void handleNetworkRelatedExceptions(
    Object error, String? url, Function(Object)? onError) {
  if (onError != null) {
    onError(error);
  } else {
    log('Network-related exception: $error');
  }
}

void handleUnexpectedException(Function(Object) onError,
    {required Object error}) {
  onError(error);
}

void handleExceptionsToast({required Object error}) {
  if (error is DioException) {
    String errorMessage = 'حدث خطأ غير متوقع';

    final responseData = error.response?.data;

    if (responseData is String) {
      try {
        final parsedData = json.decode(responseData);
        if (parsedData is Map<String, dynamic>) {
          errorMessage =
              parsedData['error'] ?? parsedData['message'] ?? errorMessage;
        } else if (parsedData is List && parsedData.isNotEmpty) {
          errorMessage = parsedData.first.toString();
        }
      } catch (_) {
        errorMessage = responseData;
      }
    } else if (responseData is Map<String, dynamic>) {
      // Handling the nested error structure
      final errorContent = responseData['error'];
      if (errorContent is Map<String, dynamic>) {
        errorMessage =
            errorContent['message'] ?? errorContent['details'] ?? errorMessage;
      } else {
        errorMessage =
            responseData['error'] ?? responseData['message'] ?? errorMessage;
      }
    } else if (responseData is List && responseData.isNotEmpty) {
      errorMessage = responseData.first.toString();
    }

    CustomToast.showToast(
      type: ToastificationType.error,
      message: errorMessage,
    );
  } else {
    CustomToast.showToast(
      type: ToastificationType.error,
      message: error.toString(),
    );
  }
}
