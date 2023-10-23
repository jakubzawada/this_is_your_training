import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/data/data_sources/my_account_remote_data_source.dart';
import 'package:this_is_your_training/repositories/my_account_repository.dart';

class MockLoginDataSource extends Mock implements MyAccountRemoteDataSource {}

void main() {
  late MyAccountRepository sut;
  late MockLoginDataSource dataSource;

  setUp(() {
    dataSource = MockLoginDataSource();
    sut = MyAccountRepository(myAccountDataSource: dataSource);
  });
  group('uploadImage', () {
    final File selectedImage = File('path_to_image.jpg');
    const String imageUrl = 'imageUrl.jpg';
    test('should call dataSource.uploadImage() method ', () async {
      // 1
      when(() => dataSource.uploadImage(selectedImage))
          .thenAnswer((_) async => '');

      // 2
      await sut.uploadImage(selectedImage);

      // 3
      verify(() => dataSource.uploadImage(selectedImage)).called(1);
    });
    test('uploadImage should return a String', () async {
      // 1
      when(() => dataSource.uploadImage(selectedImage))
          .thenAnswer((_) async => imageUrl);
      // 2
      final results = await sut.uploadImage(selectedImage);
      // 3
      expect(results, 'imageUrl.jpg');
    });
  });

  group('updatePostsWithNewAvatar', () {
    const newAvatarUrl = 'new_avatar_url';
    test('should call dataSource.updatePostsWithNewAvatar() method ', () async {
      // 1
      when(() => dataSource.updatePostsWithNewAvatar(newAvatarUrl))
          .thenAnswer((_) async => Stream.value('image_url'));
      // 2
      sut.updatePostsWithNewAvatar(newAvatarUrl);
      // 3
      verify(() => dataSource.updatePostsWithNewAvatar(newAvatarUrl)).called(1);
    });
  });

  group('deleteAccount', () {
    test('should call dataSource.deleteAccount() method', () async {
      // 1
      when(() => dataSource.deleteAccount()).thenAnswer((_) async {});
      // 2
      sut.deleteAccount();
      // 3
      verify(() => dataSource.deleteAccount()).called(1);
    });
  });

  group('getLatestImageStream', () {
    test('should call dataSource.getLastestImageStream() method', () async {
      // 1
      when(() => dataSource.getLatestImageStream())
          .thenAnswer((_) => Stream.value('image_url'));
      // 2
      sut.getLatestImageStream();
      // 3
      verify(() => dataSource.getLatestImageStream()).called(1);
    });

    test('should return latest image URL', () {
      // 1
      when(() => dataSource.getLatestImageStream())
          .thenAnswer((_) => Stream.value('image_url'));
      // 2
      final results = sut.getLatestImageStream();
      // 3
      expect(results, emits('image_url'));
    });
  });
}
