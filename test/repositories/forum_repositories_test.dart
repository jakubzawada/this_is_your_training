import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/data/forum_data_sources/forum_remote_data_source.dart';
import 'package:this_is_your_training/repositories/forum_repository.dart';

class MockForumDataSource extends Mock implements ForumRemoteDataSource {}

void main() {
  late ForumRepository sut;
  late MockForumDataSource dataSource;

  setUp(() {
    dataSource = MockForumDataSource();
    sut = ForumRepository(forumdataSource: dataSource);
  });

  group('getPostsStream', () {
    test('should return a list of ForumModel', () {
      // 1
      // 2
      // 3
    });
  });
}
