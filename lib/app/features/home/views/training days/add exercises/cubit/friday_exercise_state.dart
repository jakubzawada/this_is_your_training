part of 'friday_exercise_cubit.dart';

@immutable
class FridayExerciseState {
  const FridayExerciseState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
