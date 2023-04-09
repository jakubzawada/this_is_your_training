import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'sunday_exercise_state.dart';

class SundayExerciseCubit extends Cubit<SundayExerciseState> {
  SundayExerciseCubit()
      : super(
          SundayExerciseState(),
        );

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    FirebaseFirestore.instance.collection('trainings6').add({
      'name6': exerciseName,
      'series6': series,
      'repeat6': repeat,
    });
  }
}
