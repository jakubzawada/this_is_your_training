part of 'my_account_cubit.dart';

@immutable
class MyAccountState {
  final bool saved;
  final String errorMessage;
  final File? selectedImage;
  final User? user;
  final String? avatarUrl;

  const MyAccountState({
    this.saved = false,
    this.errorMessage = '',
    this.selectedImage,
    this.user,
    this.avatarUrl,
  });

  MyAccountState copyWith({
    File? selectedImage,
    User? user,
    String? avatarUrl,
  }) {
    return MyAccountState(
      selectedImage: selectedImage ?? this.selectedImage,
      user: user ?? this.user,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
