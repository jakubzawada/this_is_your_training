import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/data/data_sources/training_remote_data_source.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsRemoteDataSource extends Mock
    implements TrainingsRemoteDataSource {}

void main() {
  late TrainingsDocumentsRepository sut;
  late MockTrainingsRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockTrainingsRemoteDataSource();
    sut = TrainingsDocumentsRepository(trainingsDataSource: dataSource);
  });

  group('delete', () {
    test('should call trainingDataSource.delete() method', () async {
      // 1
      when(() => dataSource.delete(id: '555')).thenAnswer((_) async => []);
      // 2
      await sut.delete(id: '555');
      // 3
      verify(() => dataSource.delete(id: '555')).called(1);
    });
  });

  group('addexercise', () {
    test('should call trainingsDataSource.addexercise() method', () async {
      // 1
      when(() => dataSource.addexercise('exerciseName', 3, 10)).thenAnswer(
        (_) async => [],
      );
      // 2
      await sut.addexercise('exerciseName', 3, 10);
      // 3
      verify(() => dataSource.addexercise('exerciseName', 3, 10)).called(1);
    });
  });

  group('delete1', () {
    test('should call trainingDataSource.delete1() method', () async {
      // 1
      when(() => dataSource.delete1(id: '555')).thenAnswer((_) async => []);
      // 2
      await sut.delete1(id: '555');
      // 3
      verify(() => dataSource.delete1(id: '555')).called(1);
    });
  });
  group('addexercise1', () {
    test('should call trainingsDataSource.addexercise1() method', () async {
      // 1
      when(() => dataSource.addexercise1('exerciseName1', 3, 10)).thenAnswer(
        (_) async => [],
      );
      // 2
      await sut.addexercise1('exerciseName1', 3, 10);
      // 3
      verify(() => dataSource.addexercise1('exerciseName1', 3, 10)).called(1);
    });
  });

  group('delete2', () {
    test('should call trainingDataSource.delete2() method', () async {
      // 1
      when(() => dataSource.delete2(id: '555')).thenAnswer((_) async => []);
      // 2
      await sut.delete2(id: '555');
      // 3
      verify(() => dataSource.delete2(id: '555')).called(1);
    });
  });

  group('addexercise2', () {
    test('should call trainingsDataSource.addexercise2() method', () async {
      // 1
      when(() => dataSource.addexercise2('exerciseName2', 3, 10)).thenAnswer(
        (_) async => [],
      );
      // 2
      await sut.addexercise2('exerciseName2', 3, 10);
      // 3
      verify(() => dataSource.addexercise2('exerciseName2', 3, 10)).called(1);
    });
  });

  group('delete3', () {
    test('should call trainingDataSource.delete3() method', () async {
      // 1
      when(() => dataSource.delete3(id: '555')).thenAnswer((_) async => []);
      // 2
      await sut.delete3(id: '555');
      // 3
      verify(() => dataSource.delete3(id: '555')).called(1);
    });
  });

  group('addexercise3', () {
    test('should call trainingsDataSource.addexercise3() method', () async {
      // 1
      when(() => dataSource.addexercise3('exerciseName3', 3, 10)).thenAnswer(
        (_) async => [],
      );
      // 2
      await sut.addexercise3('exerciseName3', 3, 10);
      // 3
      verify(() => dataSource.addexercise3('exerciseName3', 3, 10)).called(1);
    });
  });

  group('delete4', () {
    test('should call trainingDataSource.delete4() method', () async {
      // 1
      when(() => dataSource.delete4(id: '555')).thenAnswer((_) async => []);
      // 2
      await sut.delete4(id: '555');
      // 3
      verify(() => dataSource.delete4(id: '555')).called(1);
    });
  });

  group('addexercise4', () {
    test('should call trainingsDataSource.addexercise4() method', () async {
      // 1
      when(() => dataSource.addexercise4('exerciseName4', 3, 10)).thenAnswer(
        (_) async => [],
      );
      // 2
      await sut.addexercise4('exerciseName4', 3, 10);
      // 3
      verify(() => dataSource.addexercise4('exerciseName4', 3, 10)).called(1);
    });
  });

  group('delete5', () {
    test('should call trainingDataSource.delete5() method', () async {
      // 1
      when(() => dataSource.delete5(id: '555')).thenAnswer((_) async => []);
      // 2
      await sut.delete5(id: '555');
      // 3
      verify(() => dataSource.delete5(id: '555')).called(1);
    });
  });

  group('addexercise5', () {
    test('should call trainingsDataSource.addexercise5() method', () async {
      // 1
      when(() => dataSource.addexercise5('exerciseName5', 3, 10)).thenAnswer(
        (_) async => [],
      );
      // 2
      await sut.addexercise5('exerciseName5', 3, 10);
      // 3
      verify(() => dataSource.addexercise5('exerciseName5', 3, 10)).called(1);
    });
  });

  group('delete6', () {
    test('should call trainingDataSource.delete6() method', () async {
      // 1
      when(() => dataSource.delete6(id: '555')).thenAnswer((_) async => []);
      // 2
      await sut.delete6(id: '555');
      // 3
      verify(() => dataSource.delete6(id: '555')).called(1);
    });
  });

  group('addexercise6', () {
    test('should call trainingsDataSource.addexercise6() method', () async {
      // 1
      when(() => dataSource.addexercise6('exerciseName6', 3, 10)).thenAnswer(
        (_) async => [],
      );
      // 2
      await sut.addexercise6('exerciseName6', 3, 10);
      // 3
      verify(() => dataSource.addexercise6('exerciseName6', 3, 10)).called(1);
    });
  });
}
