part of 'saturday_exercise_cubit.dart';

@freezed
class SaturdayExerciseState with _$SaturdayExerciseState {
  factory SaturdayExerciseState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
    @Default('') String exerciseName5,
    int? series5,
    int? repeat5,
  }) = _SaturdayExerciseState;
}
