part of 'friday_exercise_cubit.dart';

@freezed
class FridayExerciseState with _$FridayExerciseState {
  factory FridayExerciseState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
    @Default('') String exerciseName4,
    int? series4,
    int? repeat4,
  }) = _FridayExerciseState;
}
