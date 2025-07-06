import '../../../../core/shared_use_cases/use_case_generic_templates/use_case.dart';
import '../entites/user_entity.dart';
import '../repos/auth_repository.dart';

class UserRefreshTokenUseCase implements SingleFutureUseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;

  UserRefreshTokenUseCase({required this.authRepository});

  @override
  Future<UserEntity> call(NoParams noParams) {
    return authRepository.userRefreshToken();
  }
}
