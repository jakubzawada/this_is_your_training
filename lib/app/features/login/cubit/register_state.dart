part of 'register_cubit.dart';

@immutable
class RegisterState {
  final bool isCreatingAccount;
  final String errorMessage;

  const RegisterState({
    required this.isCreatingAccount,
    required this.errorMessage,
  });
}
