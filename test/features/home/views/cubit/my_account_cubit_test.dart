import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/my_account_cubit.dart';
import 'package:this_is_your_training/repositories/my_account_repository.dart';

class MockMyAccountRepository extends Mock implements MyAccountRepository {}

void main() {
  late MyAccountCubit sut;
  late MockMyAccountRepository repository;

  setUp(() {
    repository = MockMyAccountRepository();
    sut = MyAccountCubit(myAccountRepository: repository);
  });

  group('selectImage', () {
    blocTest<MyAccountCubit, MyAccountState>(
      'emits [] when selectImage is called with null imageSource',
      build: () => sut,
      act: (cubit) => cubit.selectImage(imageSource: null),
      expect: () => [],
    );
  });

  group('setAvatarUrl and emit  saved true', () {
    setUp(() {
      when(() => repository.updatePostsWithNewAvatar('newAvatarUrl'))
          .thenAnswer((_) async {});
    });
    blocTest<MyAccountCubit, MyAccountState>(
      'emit saved true',
      build: () => sut,
      act: (cubit) => cubit.setAvatarUrl('newAvatarUrl'),
      expect: () => [MyAccountState(saved: true)],
    );
  });

  group('failer setAvatarUrl', () {
    setUp(() {
      when(() => repository.updatePostsWithNewAvatar('newAvatarUrl')).thenThrow(
        Exception('test-exception-error'),
      );
    });

    blocTest<MyAccountCubit, MyAccountState>(
      'emits Status.error with error message',
      build: () => sut,
      act: (cubit) => cubit.setAvatarUrl('newAvatarUrl'),
      expect: () => [
        MyAccountState(
          status: Status.error,
          errorMessage: 'Exception: test-exception-error',
        )
      ],
    );
  });

  group('deleteAccount and emit  saved true', () {
    setUp(() {
      when(() => repository.deleteAccount()).thenAnswer((_) async {});
    });
    blocTest<MyAccountCubit, MyAccountState>(
      'emit saved true',
      build: () => sut,
      act: (cubit) => cubit.deleteAccount(),
      expect: () => [MyAccountState(saved: true)],
    );
  });

  group('failer deleteAccount', () {
    setUp(() {
      when(() => repository.deleteAccount()).thenThrow(
        Exception('test-exception-error'),
      );
    });

    blocTest<MyAccountCubit, MyAccountState>(
      'emits Status.error with error message',
      build: () => sut,
      act: (cubit) => cubit.deleteAccount(),
      expect: () => [
        MyAccountState(
          status: Status.error,
          errorMessage: 'Exception: test-exception-error',
        )
      ],
    );
  });
}
