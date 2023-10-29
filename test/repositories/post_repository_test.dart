import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/data/data_sources/post_remote_data_source.dart';
import 'package:this_is_your_training/repositories/post_repository.dart';

class MockPostDataSource extends Mock implements PostRemoteDataSource {}

void main() {
  late PostRepository sut;
  late MockPostDataSource dataSource;

  setUp(() {
    dataSource = MockPostDataSource();
    sut = PostRepository(postDataSource: dataSource);
  });

  group('like', () {
    test('should call remoteDataSource.like() method', () async {
      // 1
      when(() => dataSource.like(postId: '555', isLiked: false))
          .thenAnswer((_) async => []);
      // 2
      await sut.like(postId: '555', isLiked: false);
      // 3
      verify(() => dataSource.like(postId: '555', isLiked: false)).called(1);
    });
  });

  group('addComment', () {
    test('should call remoteDataSource.addComment() method', () async {
      // 1
      when(() =>
              dataSource.addComment(postId: '555', commentText: 'commentText'))
          .thenAnswer((_) async => []);
      // 2
      await sut.addComment(postId: '555', commentText: 'commentText');
      // 3
      verify(() =>
              dataSource.addComment(postId: '555', commentText: 'commentText'))
          .called(1);
    });
  });

  group('postDelete', () {
    test('should call remoteDataSource.postDelete() method', () async {
      // 1
      when(() => dataSource.postDelete(postId: '555'))
          .thenAnswer((_) async => []);
      // 2
      await sut.postDelete(postId: '555');
      // 3
      verify(() => dataSource.postDelete(postId: '555')).called(1);
    });
  });
}
