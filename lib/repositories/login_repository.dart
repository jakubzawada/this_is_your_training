import 'package:this_is_your_training/data/data_sources/login_remote_data_source.dart';

class LoginRepository {
  LoginRepository({required this.loginDataSource});

  final LoginRemoteDataSource loginDataSource;

  Future<void> loginAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    await loginDataSource.loginAccount(
        email: email, password: password, errorMessage: errorMessage);
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    await loginDataSource.createAccount(
        email: email, password: password, errorMessage: errorMessage);
  }
}
