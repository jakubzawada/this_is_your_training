import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit()
      : super(
          const MyAccountState(),
        );

  void selectImage({required ImageSource? imageSource}) async {
    if (imageSource != null) {
      final pickedImage = await ImagePicker().pickImage(source: imageSource);
      if (pickedImage != null) {
        emit(MyAccountState(selectedImage: File(pickedImage.path)));
      }
    }
  }

  Future<void> deleteAccount() async {
    emit(MyAccountState(user: FirebaseAuth.instance.currentUser));
  }
}
