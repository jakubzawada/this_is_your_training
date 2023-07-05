part of 'sunday_exercise_cubit.dart';

@immutable
class SundayExerciseState {
  const SundayExerciseState({
    this.saved = false,
    this.errorMessage = '',
    this.exerciseName6 = '',
    this.series6,
    this.repeat6,
  });

  final bool saved;
  final String errorMessage;
  final String exerciseName6;
  final int? series6;
  final int? repeat6;
}
