import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  static void showToast({
    required ToastificationType? type,
    required String message,
    int? durationForClosing,
  }) {
    toastification.show(
      title: Text(
        message,
        maxLines: 6,
        style: const TextStyle(
          fontSize: 14,
          height: 1.5,
        ),
      ),
      autoCloseDuration: Duration(seconds: durationForClosing ?? 5),
      style: ToastificationStyle.flatColored,
      alignment: Alignment.bottomCenter,
      type: type,
    );
  }
}
