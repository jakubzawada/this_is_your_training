import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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
      'emit toggle isPasswordVisable',
      build: () => sut,
      act: (cubit) => cubit.obscureText(),
      expect: () => [
        LoginState(
          isPasswordVisible: true,
        ),
      ],
    );
  });
}
