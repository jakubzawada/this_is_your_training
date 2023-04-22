part of 'login_cubit.dart';

@immutable
class LoginState {
  final bool isCreatingAccount;
  final String errorMessage;

  const LoginState({
    required this.isCreatingAccount,
    required this.errorMessage,
  });
}
