import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'friday_exercise_state.dart';

class FridayExerciseCubit extends Cubit<FridayExerciseState> {
  FridayExerciseCubit(this._documentsRepository)
      : super(
          const FridayExerciseState(),
        );

  final DocumentsRepository _documentsRepository;

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await _documentsRepository.addexercise4(exerciseName, series, repeat);
      emit(const FridayExerciseState(saved: true));
    } catch (error) {
      emit(FridayExerciseState(errorMessage: error.toString()));
    }
  }
}
