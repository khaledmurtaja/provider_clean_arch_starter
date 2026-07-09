import 'package:equatable/equatable.dart';

import '../../../../core/shared_use_cases/use_case_generic_templates/use_case.dart';
import '../entites/user_entity.dart';
import '../repos/auth_repository.dart';


class UserLoginUseCase implements SingleFutureUseCase<UserEntity, LoginParams> {

  final AuthRepository authRepository;

  UserLoginUseCase({required this.authRepository});

  @override
  Future<UserEntity> call(LoginParams params) {
    return authRepository.userLogin(
      username: params.userName,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String userName, password;

  const LoginParams({
    required this.userName,
    required this.password,
  });

  @override
  List<Object?> get props => [
    userName,
    password,
  ];
}
