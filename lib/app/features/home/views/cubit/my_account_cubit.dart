import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  String? avatarUrl;
  MyAccountCubit(this._documentsRepository)
      : super(
          const MyAccountState(),
        );

  final DocumentsRepository _documentsRepository;

  void selectImage({required ImageSource? imageSource}) async {
    if (imageSource != null) {
      final pickedImage = await ImagePicker().pickImage(source: imageSource);
      if (pickedImage != null) {
        emit(state.copyWith(selectedImage: File(pickedImage.path)));
      }
    }
  }

  void setAvatarUrl(String? newAvatarUrl) {
    emit(state.copyWith(avatarUrl: newAvatarUrl));
    avatarUrl = newAvatarUrl;
    updatePostsWithNewAvatar(newAvatarUrl);
  }

  Future<void> updatePostsWithNewAvatar(String? newAvatarUrl) async {
    try {
      await _documentsRepository.updatePostsWithNewAvatar(newAvatarUrl);
      emit(const MyAccountState(saved: true));
    } catch (error) {
      emit(MyAccountState(errorMessage: error.toString()));
    }
  }

  void updateAvatarUrl(String? avatarUrl) {
    emit(state.copyWith(avatarUrl: avatarUrl));
  }

  Future<void> deleteAccount() async {
    try {
      await _documentsRepository.deleteAccount();
      emit(const MyAccountState(saved: true));
    } catch (error) {
      emit(MyAccountState(errorMessage: error.toString()));
    }
  }
}
