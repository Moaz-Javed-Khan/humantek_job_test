import 'package:humantek_test/features/login/Domain/repositories/login_repository.dart';

class UserloginUsecase {
  final LoginRepository repository;

  UserloginUsecase({required this.repository});
  execute(
    String email,
    String passsword,
  ) async {
    return repository.userlogin(
      email: email,
      password: passsword,
    );
  }
}
