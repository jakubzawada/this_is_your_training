import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/friday_cubit.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late FridayCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = FridayCubit(documentsRepository: repository);
  });

  group('start', () {
    group('success', () {
      setUp(() {
        when(() => repository.getDocumentsStream4()).thenAnswer(
          (_) => Stream.value(
            [
              TrainingModel('name', '1', 3, 13),
              TrainingModel('name1', '2', 4, 14),
              TrainingModel('name1', '2', 5, 15),
            ],
          ),
        );
      });

      blocTest<FridayCubit, FridayState>(
        'emits Status.loading then Status.succes with resluts',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          FridayState(
            status: Status.loading,
          ),
          FridayState(
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
        when(() => repository.getDocumentsStream4())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<FridayCubit, FridayState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          FridayState(
            status: Status.loading,
          ),
          FridayState(
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
        when(() => repository.delete4(id: documentId)).thenAnswer((_) async {});
      });

      blocTest<FridayCubit, FridayState>(
        'delete document and emit Status.succes',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [
          FridayState(
            status: Status.succes,
          ),
        ],
      );
    });
    group('failure', () {
      const documentId = 'document_id_to_delete';
      setUp(() {
        when(() => repository.delete4(id: documentId))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<FridayCubit, FridayState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [
          FridayState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
