part of 'my_account_cubit.dart';

@freezed
class MyAccountState with _$MyAccountState {
  factory MyAccountState({
    @Default(false) bool saved,
    String? errorMessage,
    File? selectedImage,
    User? user,
    String? avatarUrl,
  }) = _MyAccountState;
}
