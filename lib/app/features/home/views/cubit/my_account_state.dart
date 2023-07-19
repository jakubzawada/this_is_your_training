part of 'my_account_cubit.dart';

@immutable
class MyAccountState {
  final File? selectedImage;
  final User? user;
  final String? avatarUrl;

  const MyAccountState({
    this.selectedImage,
    this.user,
    this.avatarUrl,
  });

  // Metoda do kopiowania stanu z aktualizacją poszczególnych pól
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
