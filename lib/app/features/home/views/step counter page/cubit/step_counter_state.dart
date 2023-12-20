part of 'step_counter_cubit.dart';

class StepCounterState {
  final int steps;
  final String stepCount;
  final String caloriesBurned;
  final String distanceTraveled;

  StepCounterState({
    required this.steps,
    required this.stepCount,
    required this.caloriesBurned,
    required this.distanceTraveled,
  });

  StepCounterState copyWith({
    int? steps,
    String? stepCount,
    String? caloriesBurned,
    String? distanceTraveled,
  }) {
    return StepCounterState(
      steps: steps ?? this.steps,
      stepCount: stepCount ?? this.stepCount,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      distanceTraveled: distanceTraveled ?? this.distanceTraveled,
    );
  }
}
