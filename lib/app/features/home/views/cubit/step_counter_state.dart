part of 'step_counter_cubit.dart';

class StepCounterState {
  final int steps;
  final String stepCount;
  final String caloriesBurned;
  final String distanceTraveled;
  final int goalSteps;

  StepCounterState({
    required this.steps,
    required this.stepCount,
    required this.caloriesBurned,
    required this.distanceTraveled,
    required this.goalSteps,
  });

  StepCounterState copyWith({
    int? steps,
    String? stepCount,
    String? caloriesBurned,
    String? distanceTraveled,
    int? goalSteps,
  }) {
    return StepCounterState(
      steps: steps ?? this.steps,
      stepCount: stepCount ?? this.stepCount,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      distanceTraveled: distanceTraveled ?? this.distanceTraveled,
      goalSteps: goalSteps ?? this.goalSteps,
    );
  }
}
