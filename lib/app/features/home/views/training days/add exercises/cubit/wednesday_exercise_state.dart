part of 'wednesday_exercise_cubit.dart';

@immutable
class WednesdayExerciseState {
  const WednesdayExerciseState({
    this.saved = false,
    this.errorMessage = '',
    this.exerciseName2 = '',
    this.series2,
    this.repeat2,
  });

  final bool saved;
  final String errorMessage;
  final String exerciseName2;
  final int? series2;
  final int? repeat2;
}
