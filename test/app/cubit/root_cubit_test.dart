import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/cubit/root_cubit.dart';
import 'package:this_is_your_training/repositories/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late RootCubit sut;
  late MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    sut = RootCubit(authRepository: repository);
  });

  group('start', () {
    group('succes', () {
      setUp(() {
        when(() => repository.start()).thenAnswer(
          (_) => Stream.value(
            null,
          ),
        );
      });

      blocTest<RootCubit, RootState>(
        'emit Status.loading then Status.success with user',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          RootState(
            status: Status.loading,
          ),
          RootState(
            status: Status.succes,
            user: null,
          ),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.start())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<RootCubit, RootState>('emit Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                RootState(
                  status: Status.loading,
                  user: null,
                ),
                RootState(
                  status: Status.error,
                  errorMessage: 'Exception: test-exception-error',
                  user: null,
                ),
              ]);
    });
  });

  group('signOut', () {
    group('succes', () {
      setUp(() {
        when(() => repository.signOut()).thenAnswer((_) async => {});
      });
      blocTest<RootCubit, RootState>('emit Status.succes',
          build: () => sut,
          act: (cubit) => cubit.signOut(),
          expect: () => [
                RootState(
                  status: Status.succes,
                ),
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.signOut())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<RootCubit, RootState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.signOut(),
        expect: () => [
          RootState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
          )
        ],
      );
    });
  });
}
