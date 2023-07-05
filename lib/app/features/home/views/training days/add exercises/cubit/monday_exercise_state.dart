part of 'monday_exercise_cubit.dart';

@immutable
class MondayExerciseState {
  const MondayExerciseState({
    this.saved = false,
    this.errorMessage = '',
    this.exerciseName = '',
    this.series,
    this.repeat,
  });

  final bool saved;
  final String errorMessage;
  final String exerciseName;
  final int? series;
  final int? repeat;
}
