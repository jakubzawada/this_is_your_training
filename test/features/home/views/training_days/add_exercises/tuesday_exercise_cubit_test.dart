import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/tuesday_exercise_cubit.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late TuesdayExerciseCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = TuesdayExerciseCubit(documentsRepository: repository);
  });
  group('uploadName1', () {
    const newValue = 'New Exercise Name';

    blocTest<TuesdayExerciseCubit, TuesdayExerciseState>(
      'emit exerciseName1',
      build: () => sut,
      act: (cubit) => cubit.uploadName1(newValue),
      expect: () => [
        TuesdayExerciseState(
          exerciseName1: 'New Exercise Name',
          series1: null,
          repeat1: null,
        ),
      ],
    );
  });

  group('uploadSeries1', () {
    const newVal = 1;

    blocTest<TuesdayExerciseCubit, TuesdayExerciseState>(
      'emit series1',
      build: () => sut,
      act: (cubit) => cubit.uploadSeries1(newVal),
      expect: () => [
        TuesdayExerciseState(
          exerciseName1: '',
          series1: 1,
          repeat1: null,
        ),
      ],
    );
  });

  group('uploadRepeat1', () {
    const newVal = 10;

    blocTest<TuesdayExerciseCubit, TuesdayExerciseState>(
      'emit repeat1',
      build: () => sut,
      act: (cubit) => cubit.uploadRepeat1(newVal),
      expect: () => [
        TuesdayExerciseState(
          exerciseName1: '',
          series1: null,
          repeat1: 10,
        ),
      ],
    );
  });

  group('addexercise', () {
    group('success', () {
      setUp(() {
        when(() => repository.addexercise1('exerciseName', 3, 10))
            .thenAnswer((_) async {});
      });
      blocTest<TuesdayExerciseCubit, TuesdayExerciseState>(
        'emits saved true if repository call success',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          TuesdayExerciseState(saved: true),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.addexercise1('exerciseName', 3, 10))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<TuesdayExerciseCubit, TuesdayExerciseState>(
        'emit error message',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          TuesdayExerciseState(errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
