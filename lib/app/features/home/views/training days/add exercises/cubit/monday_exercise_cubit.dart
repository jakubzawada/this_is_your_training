import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'monday_exercise_state.dart';

class MondayExerciseCubit extends Cubit<MondayExerciseState> {
  MondayExerciseCubit(this._documentsRepository)
      : super(
          const MondayExerciseState(),
        );

  final DocumentsRepository _documentsRepository;

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await _documentsRepository.addexercise(exerciseName, series, repeat);
      emit(const MondayExerciseState(saved: true));
    } catch (error) {
      emit(MondayExerciseState(errorMessage: error.toString()));
    }
  }
}
