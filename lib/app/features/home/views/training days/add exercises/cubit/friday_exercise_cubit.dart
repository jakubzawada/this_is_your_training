import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'friday_exercise_state.dart';

class FridayExerciseCubit extends Cubit<FridayExerciseState> {
  FridayExerciseCubit()
      : super(
          const FridayExerciseState(),
        );

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('trainings4').add(
        {
          'name4': exerciseName,
          'series4': series,
          'repeat4': repeat,
        },
      );
      emit(const FridayExerciseState(saved: true));
    } catch (error) {
      emit(FridayExerciseState(errorMessage: error.toString()));
    }
  }
}
