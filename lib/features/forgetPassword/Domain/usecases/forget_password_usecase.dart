import 'package:humantek_test/features/forgetPassword/Domain/repositories/forget_password_repository.dart';

class ForgetPasswordUsecase {
  final ForgetPasswordRepository repository;

  ForgetPasswordUsecase({required this.repository});
  execute(
    String email,
  ) async {
    return repository.forgetPassword(
      email: email,
    );
  }
}
