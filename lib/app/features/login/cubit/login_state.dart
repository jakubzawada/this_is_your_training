part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isCreatingAccount,
    @Default('') String errorMessage,
    @Default(true) bool obscureText,
    @Default(false) bool isLoggingIn,
    @Default(Status.loading) Status status,
  }) = _LoginState;
}
