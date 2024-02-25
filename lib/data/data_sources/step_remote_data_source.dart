import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StepRemoteDataSource {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  DateTime now = DateTime.now();

  Future<void> calculateCaloriesAndDistance(
      int steps, double calories, double distance) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    DateTime now = DateTime.now();

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
