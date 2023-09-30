import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:this_is_your_training/repositories/my_account_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_account_cubit.freezed.dart';
part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  String? avatarUrl;
  MyAccountCubit({required this.myAccountRepository})
      : super(
          MyAccountState(),
        );

  final MyAccountRepository myAccountRepository;

  Future<void> selectImage({required ImageSource? imageSource}) async {
    if (imageSource != null) {
      final pickedImage = await ImagePicker().pickImage(source: imageSource);
      if (pickedImage != null) {
        emit(state.copyWith(selectedImage: File(pickedImage.path)));
      }
    }
  }

  Future<void> setAvatarUrl(String? newAvatarUrl) async {
    emit(state.copyWith(avatarUrl: newAvatarUrl));
    avatarUrl = newAvatarUrl;
    updatePostsWithNewAvatar(newAvatarUrl);
  }

  Future<void> updatePostsWithNewAvatar(String? newAvatarUrl) async {
    try {
      await myAccountRepository.updatePostsWithNewAvatar(newAvatarUrl);
      emit(MyAccountState(saved: true));
    } catch (error) {
      emit(MyAccountState(errorMessage: error.toString()));
    }
  }

  Future<void> updateAvatarUrl(String? avatarUrl) async {
    emit(state.copyWith(avatarUrl: avatarUrl));
  }

  Future<String> uploadImage(File selectedImage) async {
    return myAccountRepository.uploadImage(selectedImage);
  }

  Future<void> deleteAccount() async {
    try {
      await myAccountRepository.deleteAccount();
      emit(MyAccountState(saved: true));
    } catch (error) {
      emit(MyAccountState(errorMessage: error.toString()));
    }
  }
}
