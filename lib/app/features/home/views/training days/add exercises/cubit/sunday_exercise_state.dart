part of 'sunday_exercise_cubit.dart';

@freezed
class SundayExerciseState with _$SundayExerciseState {
  factory SundayExerciseState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
    @Default('') String exerciseName6,
    int? series6,
    int? repeat6,
  }) = _SundayExerciseState;
}
