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

  group('toogleAccountCreate', () {
    blocTest('emit isCreatingAccount true',
        build: () => sut,
        act: (cubit) => cubit.tooglAccountCreate(true),
        expect: () => [
              LoginState(
                isCreatingAccount: true,
              ),
            ]);
  });

  group('toogleAccountLogin', () {
    blocTest('emit isCreatingAccount false',
        build: () => sut,
        act: (cubit) => cubit.tooglAccountLogin(false),
        expect: () => [
              LoginState(
                isCreatingAccount: false,
              ),
            ]);
  });

  group('loginAccount', () {
    group('succes', () {
      const email = 'test@email.com';
      const password = 'password123';
      const errorMessage = 'Test error message';
      setUp(() {
        when(() => repository.loginAccount(
              email: email,
              password: password,
              errorMessage: errorMessage,
            )).thenAnswer((_) async => '');
      });
      blocTest<LoginCubit, LoginState>('emit Status.succes',
          build: () => sut,
          act: (cubit) => cubit.loginAccount(
              email: email, password: password, errorMessage: errorMessage),
          expect: () => [
                LoginState(
                  status: Status.succes,
                ),
              ]);
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
  });

  group('createAccount', () {
    group('succes', () {
      const email = 'test@email.com';
      const password = 'password123';
      const errorMessage = 'Test error message';
      setUp(() {
        when(() => repository.createAccount(
              email: email,
              password: password,
              errorMessage: errorMessage,
            )).thenAnswer((_) async => '');
      });
      blocTest<LoginCubit, LoginState>('emit Status.succes',
          build: () => sut,
          act: (cubit) => cubit.createAccount(
              email: email, password: password, errorMessage: errorMessage),
          expect: () => [
                LoginState(
                  status: Status.succes,
                ),
              ]);
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
  });
}
