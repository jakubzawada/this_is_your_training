import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'tuesday_exercise_state.dart';

class TuesdayExerciseCubit extends Cubit<TuesdayExerciseState> {
  TuesdayExerciseCubit()
      : super(
          TuesdayExerciseState(),
        );

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    FirebaseFirestore.instance.collection('trainings1').add({
      'name1': exerciseName,
      'series1': series,
      'repeat1': repeat,
    });
  }
}
