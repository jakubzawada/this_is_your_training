import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'tuesday_exercise_state.dart';

class TuesdayExerciseCubit extends Cubit<TuesdayExerciseState> {
  TuesdayExerciseCubit(this._documentsRepository)
      : super(
          const TuesdayExerciseState(),
        );

  final DocumentsRepository _documentsRepository;

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await _documentsRepository.addexercise1(exerciseName, series, repeat);
      emit(const TuesdayExerciseState(saved: true));
    } catch (error) {
      emit(TuesdayExerciseState(errorMessage: error.toString()));
    }
  }
}
