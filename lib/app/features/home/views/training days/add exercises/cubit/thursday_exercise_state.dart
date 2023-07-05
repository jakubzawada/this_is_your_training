part of 'thursday_exercise_cubit.dart';

@immutable
class ThursdayExerciseState {
  const ThursdayExerciseState({
    this.saved = false,
    this.errorMessage = '',
    this.exerciseName3 = '',
    this.series3,
    this.repeat3,
  });

  final bool saved;
  final String errorMessage;
  final String exerciseName3;
  final int? series3;
  final int? repeat3;
}
