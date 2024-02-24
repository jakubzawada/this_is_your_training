part of 'step_counter_cubit.dart';

@freezed
class StepCounterState with _$StepCounterState {
  factory StepCounterState({
    @Default(0) int steps,
    @Default('0') String stepCount,
    @Default('0') String caloriesBurned,
    @Default('0') String distanceTraveled,
    @Default(6000) int goalSteps,
    @Default(true) bool isPedometerActive,
    @Default('') String errorMessage,
    @Default(Status.loading) Status status,
  }) = _StepCounterState;
}
