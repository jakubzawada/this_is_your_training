part of 'monday_exercise_cubit.dart';

@immutable
class MondayExerciseState {
  const MondayExerciseState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
