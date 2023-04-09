import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'monday_exercise_state.dart';

class MondayExerciseCubit extends Cubit<MondayExerciseState> {
  MondayExerciseCubit()
      : super(
          MondayExerciseState(),
        );

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    FirebaseFirestore.instance.collection('trainings').add({
      'name': exerciseName,
      'series': series,
      'repeat': repeat,
    });
  }
}
