part of 'saturday_exercise_cubit.dart';

@immutable
 class SaturdayExerciseState {
  const SaturdayExerciseState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
