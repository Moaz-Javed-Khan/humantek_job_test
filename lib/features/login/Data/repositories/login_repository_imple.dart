import 'package:humantek_test/features/login/Data/datasource/login_remote_datasource.dart';
import 'package:humantek_test/features/login/Domain/repositories/login_repository.dart';

class LoginRepositoryImple extends LoginRepository {
  final LoginRemoteDatasource remotedatasources;

  LoginRepositoryImple({required this.remotedatasources});

  @override
  userlogin({
    required String email,
    required String password,
  }) async {
    try {
      final remoteData = await remotedatasources.userLogin(
        email: email,
        password: password,
      );

      return remoteData;
    } catch (error) {
      throw error.toString();
    }
  }
}
