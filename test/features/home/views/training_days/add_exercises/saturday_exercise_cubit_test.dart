import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/saturday_exercise_cubit.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late SaturdayExerciseCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = SaturdayExerciseCubit(documentsRepository: repository);
  });
  group('uploadName5', () {
    const newValue = 'New Exercise Name';

    blocTest<SaturdayExerciseCubit, SaturdayExerciseState>(
      'emit exerciseName5',
      build: () => sut,
      act: (cubit) => cubit.uploadName5(newValue),
      expect: () => [
        SaturdayExerciseState(
          exerciseName5: 'New Exercise Name',
          series5: null,
          repeat5: null,
        ),
      ],
    );
  });

  group('uploadSeries5', () {
    const newVal = 5;

    blocTest<SaturdayExerciseCubit, SaturdayExerciseState>(
      'emit series5',
      build: () => sut,
      act: (cubit) => cubit.uploadSeries5(newVal),
      expect: () => [
        SaturdayExerciseState(
          exerciseName5: '',
          series5: 5,
          repeat5: null,
        ),
      ],
    );
  });

  group('uploadRepeat5', () {
    const newVal = 10;

    blocTest<SaturdayExerciseCubit, SaturdayExerciseState>(
      'emit repeat5',
      build: () => sut,
      act: (cubit) => cubit.uploadRepeat5(newVal),
      expect: () => [
        SaturdayExerciseState(
          exerciseName5: '',
          series5: null,
          repeat5: 10,
        ),
      ],
    );
  });

  group('addexercise', () {
    group('success', () {
      setUp(() {
        when(() => repository.addexercise5('exerciseName', 3, 10))
            .thenAnswer((_) async {});
      });
      blocTest<SaturdayExerciseCubit, SaturdayExerciseState>(
        'emits saved true if repository call success',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          SaturdayExerciseState(saved: true),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.addexercise5('exerciseName', 3, 10))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<SaturdayExerciseCubit, SaturdayExerciseState>(
        'emit error message',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          SaturdayExerciseState(
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
