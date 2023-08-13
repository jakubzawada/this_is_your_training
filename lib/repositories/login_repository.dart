import 'package:this_is_your_training/data/forum_data_sources/login_remote_data_source.dart';

class LoginRepository {
  LoginRepository(this._loginDataSource);

  final LoginRemoteDataSource _loginDataSource;

  Future<void> loginAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    await _loginDataSource.loginAccount(
        email: email, password: password, errorMessage: errorMessage);
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    await _loginDataSource.createAccount(
        email: email, password: password, errorMessage: errorMessage);
  }
}
