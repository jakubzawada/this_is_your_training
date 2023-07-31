part of 'login_cubit.dart';

@immutable
class LoginState {
  final bool isCreatingAccount;
  final String errorMessage;
  final bool isPasswordVisible;
  final String password;

  const LoginState({
    required this.isCreatingAccount,
    required this.errorMessage,
    this.isPasswordVisible = false,
    required this.password,
  });

  LoginState copyWith({
    bool? isCreatingAccount,
    String? errorMessage,
    bool? isPasswordVisible,
    String? password,
  }) {
    return LoginState(
      isCreatingAccount: isCreatingAccount ?? this.isCreatingAccount,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      password: password ?? this.password,
    );
  }
}
