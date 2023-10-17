import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/saturday_cubit.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late SaturdayCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = SaturdayCubit(documentsRepository: repository);
  });

  group('start', () {
    group('success', () {
      setUp(() {
        when(() => repository.getDocumentsStream5()).thenAnswer(
          (_) => Stream.value(
            [
              TrainingModel('name', '1', 3, 13),
              TrainingModel('name1', '2', 4, 14),
              TrainingModel('name1', '2', 5, 15),
            ],
          ),
        );
      });

      blocTest<SaturdayCubit, SaturdayState>(
        'emits Status.loading then Status.succes with resluts',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          SaturdayState(
            status: Status.loading,
          ),
          SaturdayState(
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
        when(() => repository.getDocumentsStream5())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<SaturdayCubit, SaturdayState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          SaturdayState(
            status: Status.loading,
          ),
          SaturdayState(
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
        when(() => repository.delete5(id: documentId)).thenAnswer((_) async {});
      });

      blocTest<SaturdayCubit, SaturdayState>(
        'delete document',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [],
      );
    });
    group('failure', () {
      const documentId = 'document_id_to_delete';
      setUp(() {
        when(() => repository.delete5(id: documentId))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<SaturdayCubit, SaturdayState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [
          SaturdayState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
