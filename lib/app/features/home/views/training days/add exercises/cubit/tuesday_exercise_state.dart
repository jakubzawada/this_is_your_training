part of 'tuesday_exercise_cubit.dart';

@freezed
class TuesdayExerciseState with _$TuesdayExerciseState {
  factory TuesdayExerciseState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
    @Default('') String exerciseName1,
    int? series1,
    int? repeat1,
  }) = _TuesdayExerciseState;
}
