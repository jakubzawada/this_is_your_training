import 'package:bloc/bloc.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/repositories/step_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_counter_cubit.freezed.dart';
part 'step_counter_state.dart';

class StepCounterCubit extends Cubit<StepCounterState> {
  int currentSteps = 0;
  int resetSteps = 0;
  late SharedPreferences prefs;
  bool isPedometerActive = true;

  StepCounterCubit({required this.stepRepository})
      : super(
          StepCounterState(),
        ) {
    initPrefs();
    loadGoalSteps();
    initPedometer();
  }

  final StepRepository stepRepository;

  Future<void> togglePedometer() async {
    try {
      if (isPedometerActive) {
        Pedometer.stepCountStream.listen(null).cancel();
      } else {
        initPedometer();
      }
      isPedometerActive = !isPedometerActive;
      emit(state.copyWith(isPedometerActive: isPedometerActive));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> initPrefs() async {
    try {
      prefs = await SharedPreferences.getInstance();
      resetSteps = prefs.getInt('resetSteps') ?? 0;
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> loadGoalSteps() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int savedGoalSteps = prefs.getInt('goalSteps') ?? 6000;
      emit(state.copyWith(goalSteps: savedGoalSteps));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> setGoalSteps(int newGoal) async {
    try {
      emit(state.copyWith(goalSteps: newGoal));

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('goalSteps', newGoal);
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> resetStepCount() async {
    try {
      resetSteps += currentSteps;
      prefs.setInt('resetSteps', resetSteps);
      emit(state.copyWith(
        steps: 0,
        stepCount: '0',
        caloriesBurned: '0',
        distanceTraveled: '0',
      ));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> calculateCaloriesAndDistance(int steps) async {
    try {
      double caloriesPerStep = 0.04;
      double distancePerStep = 0.762;

      double calories = steps * caloriesPerStep;
      double distance = steps * distancePerStep / 1000.0;

      emit(state.copyWith(
        caloriesBurned: calories.toInt().toString(),
        distanceTraveled: distance.toStringAsFixed(2),
      ));

      stepRepository.calculateCaloriesAndDistance(steps);
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> initPedometer() async {
    try {
      Pedometer.stepCountStream.listen((StepCount event) {
        currentSteps = event.steps - resetSteps;
        prefs.setInt('currentSteps', currentSteps);
        emit(
          state.copyWith(
            stepCount: currentSteps.toString(),
          ),
        );
        calculateCaloriesAndDistance(currentSteps);
      });
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<List<double>> loadWeeklySummaryFromFirebase() async {
    List<double> weeklySummary =
        await stepRepository.loadWeeklySummaryFromFirebase();

    return weeklySummary;
  }
}
