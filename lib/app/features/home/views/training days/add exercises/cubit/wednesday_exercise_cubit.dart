import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'wednesday_exercise_state.dart';

class WednesdayExerciseCubit extends Cubit<WednesdayExerciseState> {
  WednesdayExerciseCubit()
      : super(
          WednesdayExerciseState(),
        );

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    FirebaseFirestore.instance.collection('trainings2').add({
      'name2': exerciseName,
      'series2': series,
      'repeat2': repeat,
    });
  }
}
