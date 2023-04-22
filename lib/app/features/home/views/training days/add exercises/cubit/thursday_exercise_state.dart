part of 'thursday_exercise_cubit.dart';

@immutable
class ThursdayExerciseState {
  const ThursdayExerciseState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
