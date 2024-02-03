import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'step_counter_state.dart';

class StepCounterCubit extends Cubit<StepCounterState> {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  DateTime now = DateTime.now();
  int currentSteps = 0;
  int resetSteps = 0;
  DateTime lastPauseTime = DateTime.now();
  int goalSteps = 6000;
  late SharedPreferences prefs;
  bool isPedometerActive = true;

  StepCounterCubit()
      : super(
          StepCounterState(
            steps: 0,
            stepCount: '0',
            caloriesBurned: '0',
            distanceTraveled: '0',
            goalSteps: 6000,
            isPedometerActive: true,
          ),
        ) {
    initPrefs();
    loadGoalSteps();
    initPedometer();
    resetStepsIfNewDay();
  }

  Future<void> resetStepsIfNewDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime lastResetTime =
        DateTime.fromMillisecondsSinceEpoch(prefs.getInt('lastResetTime') ?? 0);

    if (!isSameDay(now, lastResetTime)) {
      resetSteps = currentSteps;
      prefs.setInt('resetSteps', resetSteps);
      prefs.setInt('lastResetTime', now.millisecondsSinceEpoch);
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Future<void> togglePedometer() async {
    if (isPedometerActive) {
      Pedometer.stepCountStream.listen(null).cancel();
    } else {
      initPedometer();
    }
    isPedometerActive = !isPedometerActive;
    emit(state.copyWith(isPedometerActive: isPedometerActive));
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    resetSteps = prefs.getInt('resetSteps') ?? 0;
  }

  Future<void> loadGoalSteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedGoalSteps = prefs.getInt('goalSteps') ?? 6000;
    emit(state.copyWith(goalSteps: savedGoalSteps));
  }

  Future<void> setGoalSteps(int newGoal) async {
    emit(state.copyWith(goalSteps: newGoal));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('goalSteps', newGoal);
  }

  Future<void> resetStepCount() async {
    resetSteps += currentSteps;
    prefs.setInt('resetSteps', resetSteps);
    emit(state.copyWith(
      steps: 0,
      stepCount: '0',
      caloriesBurned: '0',
      distanceTraveled: '0',
    ));
  }

  Future<void> calculateCaloriesAndDistance(int steps) async {
    double caloriesPerStep = 0.04;
    double distancePerStep = 0.762;

    double calories = steps * caloriesPerStep;
    double distance = steps * distancePerStep / 1000.0;

    emit(state.copyWith(
      caloriesBurned: calories.toInt().toString(),
      distanceTraveled: distance.toStringAsFixed(2),
    ));

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('stepData')
        .doc('${now.year}-${now.month}-${now.day}')
        .set({
      'steps': steps,
      'calories': calories,
      'distance': distance,
      'timestamp': now,
    });
  }

  Future<void> initPedometer() async {
    Pedometer.stepCountStream.listen((StepCount event) {
      currentSteps = event.steps - resetSteps;

      emit(
        state.copyWith(
          stepCount: currentSteps.toString(),
        ),
      );
      calculateCaloriesAndDistance(currentSteps);
    });
  }

  Future<List<double>> loadWeeklySummaryFromFirebase() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 0));
    final endOfWeek = startOfWeek.add(const Duration(days: 7));

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('stepData')
        .where('timestamp', isGreaterThanOrEqualTo: startOfWeek)
        .where('timestamp', isLessThanOrEqualTo: endOfWeek)
        .get();

    List<double> weeklySummary = List.filled(7, 0.0);

    for (var doc in querySnapshot.docs) {
      DateTime timestamp = (doc['timestamp'] as Timestamp).toDate();
      int dayOfWeek = timestamp.weekday - 1;

      weeklySummary[dayOfWeek] += (doc['steps'] as int).toDouble();
    }

    return weeklySummary;
  }
}
