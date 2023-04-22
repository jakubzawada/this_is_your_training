part of 'sunday_exercise_cubit.dart';

@immutable
class SundayExerciseState {
  const SundayExerciseState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
