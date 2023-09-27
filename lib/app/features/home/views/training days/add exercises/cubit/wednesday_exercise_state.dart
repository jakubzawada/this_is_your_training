part of 'wednesday_exercise_cubit.dart';

@freezed
class WednesdayExerciseState with _$WednesdayExerciseState {
  factory WednesdayExerciseState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
    @Default('') String exerciseName2,
    int? series2,
    int? repeat2,
  }) = _WednesdayExerciseState;
}
