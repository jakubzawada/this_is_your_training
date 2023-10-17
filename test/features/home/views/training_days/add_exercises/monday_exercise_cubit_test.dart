import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/monday_exercise_cubit.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late MondayExerciseCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = MondayExerciseCubit(documentsRepository: repository);
  });
  group('uploadName', () {
    const newValue = 'New Exercise Name';

    blocTest<MondayExerciseCubit, MondayExerciseState>(
      'emit exerciseName',
      build: () => sut,
      act: (cubit) => cubit.uploadName(newValue),
      expect: () => [
        MondayExerciseState(
          exerciseName: 'New Exercise Name',
          series: null,
          repeat: null,
        ),
      ],
    );
  });

  group('uploadSeries', () {
    const newVal = 4;

    blocTest<MondayExerciseCubit, MondayExerciseState>(
      'emit series',
      build: () => sut,
      act: (cubit) => cubit.uploadSeries(newVal),
      expect: () => [
        MondayExerciseState(
          exerciseName: '',
          series: 4,
          repeat: null,
        ),
      ],
    );
  });

  group('uploadRepeat', () {
    const newVal = 10;

    blocTest<MondayExerciseCubit, MondayExerciseState>(
      'emit repeat',
      build: () => sut,
      act: (cubit) => cubit.uploadRepeat(newVal),
      expect: () => [
        MondayExerciseState(
          exerciseName: '',
          series: null,
          repeat: 10,
        ),
      ],
    );
  });

  group('addexercise', () {
    group('success', () {
      setUp(() {
        when(() => repository.addexercise('exerciseName', 3, 10))
            .thenAnswer((_) async {});
      });
      blocTest<MondayExerciseCubit, MondayExerciseState>(
        'emits saved true if repository call success',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          MondayExerciseState(saved: true),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.addexercise('exerciseName', 3, 10))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<MondayExerciseCubit, MondayExerciseState>(
        'emit error message',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          MondayExerciseState(errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
