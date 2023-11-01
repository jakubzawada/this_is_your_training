import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/data/data_sources/auth_remote_data_source.dart';
import 'package:this_is_your_training/repositories/auth_repository.dart';

class MockAuthDataSource extends Mock implements AuthDataSource {}

void main() {
  late AuthRepository sut;
  late MockAuthDataSource dataSource;

  setUp(() {
    dataSource = MockAuthDataSource();
    sut = AuthRepository(authdataSource: dataSource);
  });

  group('signOut', () {
    test('should call remoteDataSource.signOut() method', () async {
      // 1
      when(() => dataSource.signOut()).thenAnswer((_) async => []);
      // 2
      await sut.signOut();
      // 3
      verify(() => dataSource.signOut()).called(1);
    });
  });
}
