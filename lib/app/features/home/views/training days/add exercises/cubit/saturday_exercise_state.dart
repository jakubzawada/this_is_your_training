part of 'saturday_exercise_cubit.dart';

@immutable
class SaturdayExerciseState {
  const SaturdayExerciseState({
    this.saved = false,
    this.errorMessage = '',
    this.exerciseName5 = '',
    this.series5,
    this.repeat5,
  });

  final bool saved;
  final String errorMessage;
  final String exerciseName5;
  final int? series5;
  final int? repeat5;
}
