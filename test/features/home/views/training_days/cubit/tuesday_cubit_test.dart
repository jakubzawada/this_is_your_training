import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/tuesday_cubit.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late TuesdayCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = TuesdayCubit(documentsRepository: repository);
  });

  group('start', () {
    group('success', () {
      setUp(() {
        when(() => repository.getDocumentsStream1()).thenAnswer(
          (_) => Stream.value(
            [
              TrainingModel('name', '1', 3, 13),
              TrainingModel('name1', '2', 4, 14),
              TrainingModel('name1', '2', 5, 15),
            ],
          ),
        );
      });

      blocTest<TuesdayCubit, TuesdayState>(
        'emits Status.loading then Status.succes with resluts',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          TuesdayState(
            status: Status.loading,
          ),
          TuesdayState(
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
        when(() => repository.getDocumentsStream1())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<TuesdayCubit, TuesdayState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          TuesdayState(
            status: Status.loading,
          ),
          TuesdayState(
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
        when(() => repository.delete1(id: documentId)).thenAnswer((_) async {});
      });

      blocTest<TuesdayCubit, TuesdayState>(
        'delete document',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [],
      );
    });
    group('failure', () {
      const documentId = 'document_id_to_delete';
      setUp(() {
        when(() => repository.delete1(id: documentId))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<TuesdayCubit, TuesdayState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [
          TuesdayState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
