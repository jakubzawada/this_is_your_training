part of 'step_counter_cubit.dart';

class StepCounterState {
  final int steps;
  final String stepCount;
  final String caloriesBurned;
  final String distanceTraveled;
  final int goalSteps;
  final bool isPedometerActive;
  final String errorMessage;

  StepCounterState({
    required this.steps,
    required this.stepCount,
    required this.caloriesBurned,
    required this.distanceTraveled,
    required this.goalSteps,
    required this.isPedometerActive,
    required this.errorMessage,
  });

  StepCounterState copyWith({
    int? steps,
    String? stepCount,
    String? caloriesBurned,
    String? distanceTraveled,
    int? goalSteps,
    bool? isPedometerActive,
    String? errorMessage,
  }) {
    return StepCounterState(
      steps: steps ?? this.steps,
      stepCount: stepCount ?? this.stepCount,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      distanceTraveled: distanceTraveled ?? this.distanceTraveled,
      goalSteps: goalSteps ?? this.goalSteps,
      isPedometerActive: isPedometerActive ?? this.isPedometerActive,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
