part of 'wednesday_exercise_cubit.dart';

@immutable
class WednesdayExerciseState {
  const WednesdayExerciseState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
