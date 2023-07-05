part of 'friday_exercise_cubit.dart';

@immutable
class FridayExerciseState {
  const FridayExerciseState({
    this.saved = false,
    this.errorMessage = '',
    this.exerciseName4 = '',
    this.series4,
    this.repeat4,
  });

  final bool saved;
  final String errorMessage;
  final String exerciseName4;
  final int? series4;
  final int? repeat4;
}
