part of 'monday_exercise_cubit.dart';

@freezed
class MondayExerciseState with _$MondayExerciseState {
  factory MondayExerciseState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
    @Default('') String exerciseName,
    int? series,
    int? repeat,
  }) = _MondayExerciseState;
}
