import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/login/cubit/login_cubit.dart';
import 'package:this_is_your_training/repositories/login_repository.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  late LoginCubit sut;
  late MockLoginRepository repository;

  setUp(() {
    repository = MockLoginRepository();
    sut = LoginCubit(loginRepository: repository);
  });

  group('obscureText', () {
    blocTest<LoginCubit, LoginState>(
      'emit toggle obscureText',
      build: () => sut,
      act: (cubit) => cubit.obscureText(),
      expect: () => [
        LoginState(
          obscureText: false,
        ),
      ],
    );
  });

  group('failer', () {
    setUp(() {
      when(() => repository.loginAccount(
          email: 'email',
          password: 'password',
          errorMessage: 'test-exception-error')).thenThrow(
        Exception('test-exception-error'),
      );
    });

    blocTest<LoginCubit, LoginState>(
      'emits Status.error with error message',
      build: () => sut,
      act: (cubit) => cubit.loginAccount(
          email: 'email',
          password: 'password',
          errorMessage: 'test-exception-error'),
      expect: () => [
        LoginState(
          status: Status.error,
          errorMessage: 'Exception: test-exception-error',
        )
      ],
    );
  });

  group('failer', () {
    setUp(() {
      when(() => repository.createAccount(
          email: 'email',
          password: 'password',
          errorMessage: 'test-exception-error')).thenThrow(
        Exception('test-exception-error'),
      );
    });

    blocTest<LoginCubit, LoginState>(
      'emits Status.error with error message',
      build: () => sut,
      act: (cubit) => cubit.createAccount(
          email: 'email',
          password: 'password',
          errorMessage: 'test-exception-error'),
      expect: () => [
        LoginState(
          status: Status.error,
          errorMessage: 'Exception: test-exception-error',
        )
      ],
    );
  });
}
