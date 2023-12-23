import 'package:humantek_test/features/forgetPassword/Data/datasource/forget_password_remote_datasource.dart';
import 'package:humantek_test/features/forgetPassword/Domain/repositories/forget_password_repository.dart';

class ForgetPasswordRepositoryImple extends ForgetPasswordRepository {
  final ForgetPasswordRemoteDatasource remotedatasources;

  ForgetPasswordRepositoryImple({required this.remotedatasources});

  @override
  forgetPassword({
    required String email,
  }) async {
    try {
      final remoteData = await remotedatasources.forgetPassword(
        email: email,
      );

      return remoteData;
    } catch (error) {
      throw error.toString();
    }
  }
}
