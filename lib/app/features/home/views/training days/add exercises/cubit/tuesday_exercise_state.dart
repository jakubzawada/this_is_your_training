part of 'tuesday_exercise_cubit.dart';

@immutable
class TuesdayExerciseState {
  const TuesdayExerciseState({
    this.saved = false,
    this.errorMessage = '',
    this.exerciseName1 = '',
    this.series1,
    this.repeat1,
  });

  final bool saved;
  final String errorMessage;
  final String exerciseName1;
  final int? series1;
  final int? repeat1;
}
