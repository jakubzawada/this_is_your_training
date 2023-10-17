import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/thursday_exercise_cubit.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late ThursdayExerciseCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = ThursdayExerciseCubit(documentsRepository: repository);
  });
  group('uploadName3', () {
    const newValue = 'New Exercise Name';

    blocTest<ThursdayExerciseCubit, ThursdayExerciseState>(
      'emit exerciseName3',
      build: () => sut,
      act: (cubit) => cubit.uploadName3(newValue),
      expect: () => [
        ThursdayExerciseState(
          exerciseName3: 'New Exercise Name',
          series3: null,
          repeat3: null,
        ),
      ],
    );
  });

  group('uploadSeries3', () {
    const newVal = 3;

    blocTest<ThursdayExerciseCubit, ThursdayExerciseState>(
      'emit series3',
      build: () => sut,
      act: (cubit) => cubit.uploadSeries3(newVal),
      expect: () => [
        ThursdayExerciseState(
          exerciseName3: '',
          series3: 3,
          repeat3: null,
        ),
      ],
    );
  });

  group('uploadRepeat3', () {
    const newVal = 10;

    blocTest<ThursdayExerciseCubit, ThursdayExerciseState>(
      'emit repeat3',
      build: () => sut,
      act: (cubit) => cubit.uploadRepeat3(newVal),
      expect: () => [
        ThursdayExerciseState(
          exerciseName3: '',
          series3: null,
          repeat3: 10,
        ),
      ],
    );
  });

  group('addexercise', () {
    group('success', () {
      setUp(() {
        when(() => repository.addexercise3('exerciseName', 3, 10))
            .thenAnswer((_) async {});
      });
      blocTest<ThursdayExerciseCubit, ThursdayExerciseState>(
        'emits saved true if repository call success',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          ThursdayExerciseState(saved: true),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.addexercise3('exerciseName', 3, 10))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<ThursdayExerciseCubit, ThursdayExerciseState>(
        'emit error message',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          ThursdayExerciseState(
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
