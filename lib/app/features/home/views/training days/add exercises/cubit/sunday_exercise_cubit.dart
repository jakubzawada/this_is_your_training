import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'sunday_exercise_state.dart';

class SundayExerciseCubit extends Cubit<SundayExerciseState> {
  SundayExerciseCubit(this._documentsRepository)
      : super(
          const SundayExerciseState(),
        );

        final DocumentsRepository _documentsRepository;

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await _documentsRepository.addexercise6(exerciseName, series, repeat);
      emit(const SundayExerciseState(saved: true));
    } catch (error) {
      emit(SundayExerciseState(errorMessage: error.toString()));
    }
  }
}

