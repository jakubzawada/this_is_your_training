import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/data/forum_data_sources/login_remote_data_source.dart';
import 'package:this_is_your_training/repositories/login_repository.dart';

class MockLoginDataSource extends Mock implements LoginRemoteDataSource {}

void main() {
  late LoginRepository sut;
  late MockLoginDataSource dataSource;

  setUp(() {
    dataSource = MockLoginDataSource();
    sut = LoginRepository(loginDataSource: dataSource);
  });

  group('loginAccount', () {
    test(
        'should call loginAccount on dataSource with provided email, password, and errorMessage',
        () async {
      // 1
      const email = 'test@example.com';
      const password = 'password123';
      const errorMessage = '';
      when(() => dataSource.loginAccount(
          email: email,
          password: password,
          errorMessage: errorMessage)).thenAnswer((_) async => []);
      // 2

      await sut.loginAccount(
          email: email, password: password, errorMessage: errorMessage);
      // 3
      verify(
        () => dataSource.loginAccount(
            email: 'test@example.com',
            password: 'password123',
            errorMessage: ''),
      ).called(1);
    });
  });
  group('createAccount', () {
    test(
        'should call createAccount on dataSource with provided email, password, and errorMessage',
        () async {
      // 1
      const email = 'test@example.com';
      const password = 'password123';
      const errorMessage = '';
      when(() => dataSource.createAccount(
          email: email,
          password: password,
          errorMessage: errorMessage)).thenAnswer((_) async => []);
      // 2

      await sut.createAccount(
          email: email, password: password, errorMessage: errorMessage);
      // 3
      verify(
        () => dataSource.createAccount(
            email: 'test@example.com',
            password: 'password123',
            errorMessage: ''),
      ).called(1);
    });
  });
}
