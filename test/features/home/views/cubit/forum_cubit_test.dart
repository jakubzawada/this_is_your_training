import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/forum_cubit.dart';
import 'package:this_is_your_training/models/forum_model.dart';
import 'package:this_is_your_training/repositories/forum_repository.dart';

class MockForumRepository extends Mock implements ForumRepository {}

void main() {
  late ForumCubit sut;
  late MockForumRepository repository;

  setUp(() {
    repository = MockForumRepository();
    sut = ForumCubit(forumRepository: repository);
  });

  group('start', () {
    group('succes', () {
      final DateTime now = DateTime.now();
      setUp(() {
        when(() => repository.getPostsStream()).thenAnswer(
          (_) => Stream.value(
            [
              ForumModel(
                  'id', 'url', ['like'], 'message', now, 'user@gmail.com'),
              ForumModel(
                  'id1', 'url1', ['like1'], 'message1', now, 'user1@gmail.com'),
              ForumModel(
                  'id2', 'url2', ['like2'], 'message2', now, 'user2@gmail.com'),
            ],
          ),
        );
      });

      blocTest<ForumCubit, ForumState>(
        'emit Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          ForumState(
            status: Status.loading,
          ),
          ForumState(
            status: Status.succes,
            results: [
              ForumModel(
                  'id', 'url', ['like'], 'message', now, 'user@gmail.com'),
              ForumModel(
                  'id1', 'url1', ['like1'], 'message1', now, 'user1@gmail.com'),
              ForumModel(
                  'id2', 'url2', ['like2'], 'message2', now, 'user2@gmail.com'),
            ],
          ),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getPostsStream()).thenThrow(
          Exception('test-exception-error'),
        );
      });

      blocTest<ForumCubit, ForumState>(
        'emit Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          ForumState(
            status: Status.loading,
          ),
          ForumState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
          ),
        ],
      );
    });
  });
}
