import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'saturday_exercise_state.dart';

class SaturdayExerciseCubit extends Cubit<SaturdayExerciseState> {
  SaturdayExerciseCubit()
      : super(
          const SaturdayExerciseState(),
        );

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('trainings5').add(
        {
          'name5': exerciseName,
          'series5': series,
          'repeat5': repeat,
        },
      );
      emit(const SaturdayExerciseState(saved: true));
    } catch (error) {
      emit(SaturdayExerciseState(errorMessage: error.toString()));
    }
  }
}
