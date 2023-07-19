import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  String? avatarUrl;
  MyAccountCubit()
      : super(
          const MyAccountState(),
        );

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
    final currentUser = FirebaseAuth.instance.currentUser!;
    final postsCollection = FirebaseFirestore.instance.collection('UsersPosts');

    try {
      final userPostsSnapshot = await postsCollection
          .where('UserEmail', isEqualTo: currentUser.email)
          .get();

      for (final postDoc in userPostsSnapshot.docs) {
        await postDoc.reference.update({
          'AvatarUrl': newAvatarUrl,
        });
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error updating posts: $error');
    }
  }

  void updateAvatarUrl(String? avatarUrl) {
    emit(state.copyWith(avatarUrl: avatarUrl));
  }

  Future<void> deleteAccount() async {
    emit(state.copyWith(user: FirebaseAuth.instance.currentUser));
  }
}
