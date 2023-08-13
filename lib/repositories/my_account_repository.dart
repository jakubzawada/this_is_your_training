import 'dart:io';

import 'package:this_is_your_training/data/forum_data_sources/my_account_remote_data_source.dart';

class MyAccountRepository {
  MyAccountRepository(this._myAccountDataSource);

  final MyAccountRemoteDataSource _myAccountDataSource;

  Future<String> uploadImage(File selectedImage) async {
    return _myAccountDataSource.uploadImage(selectedImage);
  }

  Future<void> updatePostsWithNewAvatar(String? newAvatarUrl) async {
    await _myAccountDataSource.updatePostsWithNewAvatar(newAvatarUrl);
  }

  Future<void> deleteAccount() async {
    await _myAccountDataSource.deleteAccount();
  }

  Stream<String?> getLatestImageStream() {
    return _myAccountDataSource.getLatestImageStream();
  }
}
