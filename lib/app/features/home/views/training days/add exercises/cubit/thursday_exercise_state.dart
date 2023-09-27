part of 'thursday_exercise_cubit.dart';

@freezed
class ThursdayExerciseState with _$ThursdayExerciseState {
  factory ThursdayExerciseState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
    @Default('') String exerciseName3,
    int? series3,
    int? repeat3,
  }) = _ThursdayExerciseState;
}
