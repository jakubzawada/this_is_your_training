import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/friday_exercise_cubit.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late FridayExerciseCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = FridayExerciseCubit(documentsRepository: repository);
  });
  group('uploadName4', () {
    const newValue = 'New Exercise Name';

    blocTest<FridayExerciseCubit, FridayExerciseState>(
      'emit exerciseName4',
      build: () => sut,
      act: (cubit) => cubit.uploadName4(newValue),
      expect: () => [
        FridayExerciseState(
          exerciseName4: 'New Exercise Name',
          series4: null,
          repeat4: null,
        ),
      ],
    );
  });

  group('uploadSeries4', () {
    const newVal = 4;

    blocTest<FridayExerciseCubit, FridayExerciseState>(
      'emit series4',
      build: () => sut,
      act: (cubit) => cubit.uploadSeries4(newVal),
      expect: () => [
        FridayExerciseState(
          exerciseName4: '',
          series4: 4,
          repeat4: null,
        ),
      ],
    );
  });

  group('uploadRepeat4', () {
    const newVal = 10;

    blocTest<FridayExerciseCubit, FridayExerciseState>(
      'emit repeat4',
      build: () => sut,
      act: (cubit) => cubit.uploadRepeat4(newVal),
      expect: () => [
        FridayExerciseState(
          exerciseName4: '',
          series4: null,
          repeat4: 10,
        ),
      ],
    );
  });

  group('addexercise', () {
    group('success', () {
      setUp(() {
        when(() => repository.addexercise4('exerciseName', 3, 10))
            .thenAnswer((_) async {});
      });
      blocTest<FridayExerciseCubit, FridayExerciseState>(
        'emits saved true if repository call success',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          FridayExerciseState(saved: true),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.addexercise4('exerciseName', 3, 10))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<FridayExerciseCubit, FridayExerciseState>(
        'emit error message',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          FridayExerciseState(errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
