import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/post_cubit.dart';
import 'package:this_is_your_training/models/post_extended_model.dart';
import 'package:this_is_your_training/repositories/post_repository.dart';

class MockPostReopository extends Mock implements PostRepository {}

void main() {
  late PostCubit sut;
  late MockPostReopository repository;

  setUp(() {
    repository = MockPostReopository();
    sut = PostCubit(postRepository: repository);
  });

  group('like', () {
    group('success', () {
      setUp(() {
        when(() => repository.like(postId: '555', isLiked: false))
            .thenAnswer((_) async {});
      });

      blocTest<PostCubit, PostState>(
        'like',
        build: () => sut,
        act: (cubit) => cubit.like(postId: '555', isLiked: false),
        expect: () => [],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.like(postId: '555', isLiked: false))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<PostCubit, PostState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.like(postId: '555', isLiked: false),
        expect: () => [
          PostState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
          )
        ],
      );
    });
  });

  group('addComment', () {
    group('failure', () {
      setUp(() {
        when(() => repository.addComment(
                postId: '555', commentText: 'commentText'))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<PostCubit, PostState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) =>
            cubit.addComment(postId: '555', commentText: 'commentText'),
        expect: () => [
          PostState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
          )
        ],
      );
    });
  });

  group('postDelete', () {
    group('failure', () {
      setUp(() {
        when(() => repository.postDelete(postId: '555'))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<PostCubit, PostState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.postDelete(postId: '555'),
        expect: () => [
          PostState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
          )
        ],
      );
    });
  });

  group('getPost', () {
    group('success', () {
      setUp(() {
        when(() => repository.getPostData('555'))
            .thenAnswer((_) async => PostModelExtended('avatarUrl', [], true));
      });
      blocTest<PostCubit, PostState>(
        'emit Status.succes with avatarUrl, docs, isLiked',
        build: () => sut,
        act: (cubit) => cubit.getPost('555'),
        expect: () => [
          PostState(
            status: Status.succes,
            avatarUrl: 'avatarUrl',
            docs: [],
            isLiked: true,
          ),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.getPostData('555'))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<PostCubit, PostState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.getPost('555'),
        expect: () => [
          PostState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
          )
        ],
      );
    });
  });
}
