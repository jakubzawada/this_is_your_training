part of 'my_account_cubit.dart';

@immutable
class MyAccountState {
  final File? selectedImage;
  final User? user;

  const MyAccountState({
    this.selectedImage,
    this.user,
  });
}
