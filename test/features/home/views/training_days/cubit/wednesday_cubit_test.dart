import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/wednesday_cubit.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late WednesdayCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = WednesdayCubit(documentsRepository: repository);
  });

  group('start', () {
    group('success', () {
      setUp(() {
        when(() => repository.getDocumentsStream2()).thenAnswer(
          (_) => Stream.value(
            [
              TrainingModel('name', '1', 3, 13),
              TrainingModel('name1', '2', 4, 14),
              TrainingModel('name1', '2', 5, 15),
            ],
          ),
        );
      });

      blocTest<WednesdayCubit, WednesdayState>(
        'emits Status.loading then Status.succes with resluts',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          WednesdayState(
            status: Status.loading,
          ),
          WednesdayState(
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
        when(() => repository.getDocumentsStream2())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<WednesdayCubit, WednesdayState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          WednesdayState(
            status: Status.loading,
          ),
          WednesdayState(
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
        when(() => repository.delete2(id: documentId)).thenAnswer((_) async {});
      });

      blocTest<WednesdayCubit, WednesdayState>(
        'delete document and emit Status.succes',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [
          WednesdayState(
            status: Status.succes,
          ),
        ],
      );
    });
    group('failure', () {
      const documentId = 'document_id_to_delete';
      setUp(() {
        when(() => repository.delete2(id: documentId))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<WednesdayCubit, WednesdayState>(
        'emit Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.dismissible(documentid: documentId),
        expect: () => [
          WednesdayState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
