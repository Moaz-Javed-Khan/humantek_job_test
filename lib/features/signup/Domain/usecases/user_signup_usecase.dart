import 'package:humantek_test/features/signup/Domain/repositories/signup_repository.dart';

class UserSignupUsecase {
  final SignupRepository repository;

  UserSignupUsecase({required this.repository});
  execute(
    String email,
    String passsword,
  ) async {
    return repository.userSignup(
      email: email,
      password: passsword,
    );
  }
}
