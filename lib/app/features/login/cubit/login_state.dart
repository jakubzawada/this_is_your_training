part of 'login_cubit.dart';

@immutable
class LoginState {
  final bool isCreatingAccount;
  final String errorMessage;
  final bool obscureText;

  const LoginState({
    required this.isCreatingAccount,
    required this.errorMessage,
    this.obscureText = true,
  });

  LoginState copyWith({
    bool? isCreatingAccount,
    String? errorMessage,
    bool? obscureText,
  }) {
    return LoginState(
      isCreatingAccount: isCreatingAccount ?? this.isCreatingAccount,
      errorMessage: errorMessage ?? this.errorMessage,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
