import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pedometer/pedometer.dart';

part 'step_counter_state.dart';

class StepCounterCubit extends Cubit<StepCounterState> {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  DateTime now = DateTime.now();
  int currentSteps = 0;
  int resetSteps = 0;
  int goalSteps = 6000;

  StepCounterCubit()
      : super(
          StepCounterState(
            steps: 0,
            stepCount: '0',
            caloriesBurned: '0',
            distanceTraveled: '0',
            goalSteps: 6000,
          ),
        );

  void setGoalSteps(int newGoal) {
    emit(state.copyWith(goalSteps: newGoal));
  }

  Future<void> resetStepCount() async {
    resetSteps += currentSteps;
    emit(state.copyWith(
      steps: 0,
      stepCount: '0',
      caloriesBurned: '0',
      distanceTraveled: '0',
    ));
    now = DateTime.now();
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
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

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
