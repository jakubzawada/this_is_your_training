import 'dart:io';

import 'package:this_is_your_training/data/forum_data_sources/my_account_remote_data_source.dart';

class MyAccountRepository {
  MyAccountRepository({required this.myAccountDataSource});

  final MyAccountRemoteDataSource myAccountDataSource;

  Future<String> uploadImage(File selectedImage) async {
    return myAccountDataSource.uploadImage(selectedImage);
  }

  Future<void> updatePostsWithNewAvatar(String? newAvatarUrl) async {
    await myAccountDataSource.updatePostsWithNewAvatar(newAvatarUrl);
  }

  Future<void> deleteAccount() async {
    await myAccountDataSource.deleteAccount();
  }

  Stream<String?> getLatestImageStream() {
    return myAccountDataSource.getLatestImageStream();
  }
}
