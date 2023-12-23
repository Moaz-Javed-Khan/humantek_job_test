import 'package:humantek_test/features/signup/Data/datasource/signup_remote_datasource.dart';
import 'package:humantek_test/features/signup/Domain/repositories/signup_repository.dart';

class SignupRepositoryImple extends SignupRepository {
  final SignupRemoteDatasource remotedatasources;

  SignupRepositoryImple({required this.remotedatasources});

  @override
  userSignup({
    required String email,
    required String password,
  }) async {
    try {
      final remoteData = await remotedatasources.userSignup(
        email: email,
        password: password,
      );

      return remoteData;
    } catch (error) {
      throw error.toString();
    }
  }
}
