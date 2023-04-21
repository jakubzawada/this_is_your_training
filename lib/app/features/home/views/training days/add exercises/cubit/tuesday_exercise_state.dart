part of 'tuesday_exercise_cubit.dart';

@immutable
class TuesdayExerciseState {
  const TuesdayExerciseState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
