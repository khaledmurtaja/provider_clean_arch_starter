import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/utils/constants/enums/state_enums.dart';
import '../../../../core/utils/widgets/custom_toast.dart';
import '../../domain/use_cases/user_login_use_case.dart';

class UserLoginProvider extends ChangeNotifier {
  UserLoginProvider({
    required this.userLoginUseCase,
  });

  final UserLoginUseCase userLoginUseCase;

  ApiCallStatus loginCallStatus = ApiCallStatus.initial;

  TextEditingController userNameController = TextEditingController(
    text: kDebugMode ? '0102316' : '',
  );

  TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? '123456' : '',
  );

  bool isUserPasswordHidden = true;

  changeUserPasswordVisibility() {
    isUserPasswordHidden = !isUserPasswordHidden;
    notifyListeners();
  }

  Future<void> userLogin({
    required BuildContext context,
    required void Function() onSuccess,
  }) async {

    loginCallStatus = ApiCallStatus.loading;
    notifyListeners();

    try {
      await userLoginUseCase.call(
        LoginParams(
          userName: userNameController.text,
          password: passwordController.text,
        ),
      );

      showSuccessMessage();
      onSuccess.call();
      loginCallStatus = ApiCallStatus.loaded;
    } catch (error) {
      log(error.toString());
      loginCallStatus = ApiCallStatus.failed;
    }

    notifyListeners();
  }

  void showSuccessMessage() {
    CustomToast.showToast(
      type: ToastificationType.success,
      message: 'تم تسجيل الدخول بنجاح',
      durationForClosing: 4,
    );
  }



}
