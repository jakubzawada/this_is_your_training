part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isCreatingAccount,
    @Default('') String errorMessage,
    @Default(false) bool isPasswordVisible,
    @Default(Status.loading) Status status,
  }) = _LoginState;
}
