import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/wednesday_exercise_cubit.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late WednesdayExerciseCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = WednesdayExerciseCubit(documentsRepository: repository);
  });
  group('uploadName2', () {
    const newValue = 'New Exercise Name';

    blocTest<WednesdayExerciseCubit, WednesdayExerciseState>(
      'emit exerciseName2',
      build: () => sut,
      act: (cubit) => cubit.uploadName2(newValue),
      expect: () => [
        WednesdayExerciseState(
          exerciseName2: 'New Exercise Name',
          series2: null,
          repeat2: null,
        ),
      ],
    );
  });

  group('uploadSeries2', () {
    const newVal = 2;

    blocTest<WednesdayExerciseCubit, WednesdayExerciseState>(
      'emit series2',
      build: () => sut,
      act: (cubit) => cubit.uploadSeries2(newVal),
      expect: () => [
        WednesdayExerciseState(
          exerciseName2: '',
          series2: 2,
          repeat2: null,
        ),
      ],
    );
  });

  group('uploadRepeat2', () {
    const newVal = 10;

    blocTest<WednesdayExerciseCubit, WednesdayExerciseState>(
      'emit repeat2',
      build: () => sut,
      act: (cubit) => cubit.uploadRepeat2(newVal),
      expect: () => [
        WednesdayExerciseState(
          exerciseName2: '',
          series2: null,
          repeat2: 10,
        ),
      ],
    );
  });

  group('addexercise', () {
    group('success', () {
      setUp(() {
        when(() => repository.addexercise2('exerciseName', 3, 10))
            .thenAnswer((_) async {});
      });
      blocTest<WednesdayExerciseCubit, WednesdayExerciseState>(
        'emits saved true if repository call success',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          WednesdayExerciseState(saved: true),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.addexercise2('exerciseName', 3, 10))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<WednesdayExerciseCubit, WednesdayExerciseState>(
        'emit error message',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          WednesdayExerciseState(
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
