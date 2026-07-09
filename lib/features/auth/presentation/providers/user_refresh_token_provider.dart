import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/shared_use_cases/delete_user_data_use_case.dart';
import '../../../../core/shared_use_cases/get_user_data_use_case.dart';
import '../../../../core/shared_use_cases/use_case_generic_templates/use_case.dart';
import '../../../../core/utils/constants/enums/state_enums.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/use_cases/user_refresh_token_use_case.dart';

class UserRefreshTokenProvider extends ChangeNotifier {
  UserRefreshTokenProvider({
    required this.userRefreshTokenUseCase,
    required this.getUserDataUseCase,
    required this.deleteUserDataUseCase,
  });

  final UserRefreshTokenUseCase userRefreshTokenUseCase;

  final GetUserDataUseCase getUserDataUseCase;

  final DeleteUserDataUseCase deleteUserDataUseCase;

  ApiCallStatus refreshTokenCallStatus = ApiCallStatus.initial;

  UserEntity? userEntity;

  Future<void> userRefreshToken() async {
    refreshTokenCallStatus = ApiCallStatus.loading;
    notifyListeners();

    try {
      await userRefreshTokenUseCase.call(NoParams());

      refreshTokenCallStatus = ApiCallStatus.loaded;
    } catch (error) {
      log(error.toString());
      refreshTokenCallStatus = ApiCallStatus.failed;
    }

    notifyListeners();
  }

  Future<UserEntity?> getUserData() async {
    userEntity = await getUserDataUseCase.call(NoParams());
    notifyListeners();
    return userEntity;
  }

  void deleteUserData() async {
    await deleteUserDataUseCase.call(NoParams());
  }
}