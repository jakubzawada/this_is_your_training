import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'thursday_exercise_state.dart';

class ThursdayExerciseCubit extends Cubit<ThursdayExerciseState> {
  ThursdayExerciseCubit()
      : super(
          ThursdayExerciseState(),
        );

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    FirebaseFirestore.instance.collection('trainings3').add({
      'name3': exerciseName,
      'series3': series,
      'repeat3': repeat,
    });
  }
}