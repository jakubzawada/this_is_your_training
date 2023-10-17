import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/sunday_exercise_cubit.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

class MockTrainingsDocumentsRepository extends Mock
    implements TrainingsDocumentsRepository {}

void main() {
  late SundayExerciseCubit sut;
  late MockTrainingsDocumentsRepository repository;

  setUp(() {
    repository = MockTrainingsDocumentsRepository();
    sut = SundayExerciseCubit(documentsRepository: repository);
  });
  group('uploadName6', () {
    const newValue = 'New Exercise Name';

    blocTest<SundayExerciseCubit, SundayExerciseState>(
      'emit exerciseName6',
      build: () => sut,
      act: (cubit) => cubit.uploadName6(newValue),
      expect: () => [
        SundayExerciseState(
          exerciseName6: 'New Exercise Name',
          series6: null,
          repeat6: null,
        ),
      ],
    );
  });

  group('uploadSeries6', () {
    const newVal = 6;

    blocTest<SundayExerciseCubit, SundayExerciseState>(
      'emit series6',
      build: () => sut,
      act: (cubit) => cubit.uploadSeries6(newVal),
      expect: () => [
        SundayExerciseState(
          exerciseName6: '',
          series6: 6,
          repeat6: null,
        ),
      ],
    );
  });

  group('uploadRepeat6', () {
    const newVal = 10;

    blocTest<SundayExerciseCubit, SundayExerciseState>(
      'emit repeat6',
      build: () => sut,
      act: (cubit) => cubit.uploadRepeat6(newVal),
      expect: () => [
        SundayExerciseState(
          exerciseName6: '',
          series6: null,
          repeat6: 10,
        ),
      ],
    );
  });

  group('addexercise', () {
    group('success', () {
      setUp(() {
        when(() => repository.addexercise6('exerciseName', 3, 10))
            .thenAnswer((_) async {});
      });
      blocTest<SundayExerciseCubit, SundayExerciseState>(
        'emits saved true if repository call success',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          SundayExerciseState(saved: true),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.addexercise6('exerciseName', 3, 10))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<SundayExerciseCubit, SundayExerciseState>(
        'emit error message',
        build: () => sut,
        act: (cubit) async => await cubit.addexercise(
            exerciseName: 'exerciseName', series: 3, repeat: 10),
        expect: () => [
          SundayExerciseState(errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
