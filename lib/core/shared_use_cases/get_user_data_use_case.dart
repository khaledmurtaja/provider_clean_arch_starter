import '../../../features/auth/domain/entites/user_entity.dart' show UserEntity;
import '../../../features/auth/domain/repos/auth_repository.dart';
import 'use_case_generic_templates/use_case.dart';

class GetUserDataUseCase implements SingleFutureUseCase<UserEntity?, NoParams> {
  AuthRepository authRepository;

  GetUserDataUseCase({required this.authRepository});

  @override
  Future<UserEntity?> call(NoParams params) async {
    return await authRepository.getUserData();
  }
}
