import 'dart:convert';


import '../../../../../core/network/local/shared_preferences_manager.dart';
import '../../../../../core/utils/constants/strings/app_strings.dart';
import '../../../domain/entites/user_entity.dart';

class AuthLocalDataSource {
  saveUserData(UserEntity userEntity) {
    SharedPreferencesManager.set(
      key: AppStrings.userDataSharedPrefKey,
      value: json.encode(userEntity.toJson()),
    );
  }

  Future<UserEntity?> getUserData() async {
    final userData = await SharedPreferencesManager.get(
      AppStrings.userDataSharedPrefKey,
    );

    if (userData != null) {
      return UserEntity.fromJson(json.decode(userData));
    }
    return null;
  }

  Future<void> deleteUserData() async {
    await SharedPreferencesManager.remove(
      AppStrings.userDataSharedPrefKey,
    );
  }
}
