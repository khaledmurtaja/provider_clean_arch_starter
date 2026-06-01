import '../../../features/auth/domain/repos/auth_repository.dart';
import 'use_case_generic_templates/use_case.dart';

class DeleteUserDataUseCase implements SingleFutureUseCase<void, NoParams> {
  final AuthRepository authRepository;

  DeleteUserDataUseCase({required this.authRepository});

  @override
  Future<void> call(NoParams noParams) {
    return authRepository.deleteUserData();
  }
}
