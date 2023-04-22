import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'saturday_exercise_state.dart';

class SaturdayExerciseCubit extends Cubit<SaturdayExerciseState> {
  SaturdayExerciseCubit(this._documentsRepository)
      : super(
          const SaturdayExerciseState(),
        );

        final DocumentsRepository _documentsRepository;

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await _documentsRepository.addexercise5(exerciseName, series, repeat);
      emit(const SaturdayExerciseState(saved: true));
    } catch (error) {
      emit(SaturdayExerciseState(errorMessage: error.toString()));
    }
  }
}

