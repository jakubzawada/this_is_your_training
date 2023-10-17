import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/sunday_cubit.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late SundayCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = SundayCubit(documentsRepository: repository);
  });

  group('start', () {
    group('success', () {
      setUp(() {
        when(() => repository.getDocumentsStream6()).thenAnswer(
          (_) => Stream.value(
            [
              TrainingModel('name', '1', 3, 13),
              TrainingModel('name1', '2', 4, 14),
              TrainingModel('name1', '2', 5, 15),
            ],
          ),
        );
      });

      blocTest<SundayCubit, SundayState>(
        'emits Status.loading then Status.succes with resluts',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          SundayState(
            status: Status.loading,
          ),
          SundayState(
            status: Status.succes,
            results: [
              TrainingModel('name', '1', 3, 13),
              TrainingModel('name1', '2', 4, 14),
              TrainingModel('name1', '2', 5, 15),
            ],
          ),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.getDocumentsStream6())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<SundayCubit, SundayState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          SundayState(
            status: Status.loading,
          ),
          SundayState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
  group('dssmissible', () {
    group('success', () {
      const documentId = 'document_id_to_delete';
      setUp(() {
        when(() => repository.delete6(id: documentId)).thenAnswer((_) async {});
      });

      blocTest<SundayCubit, SundayState>(
        'delete document',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [],
      );
    });
    group('failure', () {
      const documentId = 'document_id_to_delete';
      setUp(() {
        when(() => repository.delete6(id: documentId))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<SundayCubit, SundayState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [
          SundayState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
