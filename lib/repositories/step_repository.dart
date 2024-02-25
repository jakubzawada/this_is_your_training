import 'package:this_is_your_training/data/data_sources/step_remote_data_source.dart';

class StepRepository {
  StepRepository({required this.stepRemoteDataSource});

  final StepRemoteDataSource stepRemoteDataSource;

  Future<void> calculateCaloriesAndDistance(
      int steps, double calories, double distance) async {
    await stepRemoteDataSource.calculateCaloriesAndDistance(
        steps, calories, distance);
  }

  Future<List<double>> loadWeeklySummaryFromFirebase() async {
    return stepRemoteDataSource.loadWeeklySummaryFromFirebase();
  }
}
