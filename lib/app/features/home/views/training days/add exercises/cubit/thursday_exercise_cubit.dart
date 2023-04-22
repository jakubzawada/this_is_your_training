import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'thursday_exercise_state.dart';

class ThursdayExerciseCubit extends Cubit<ThursdayExerciseState> {
  ThursdayExerciseCubit(this._documentsRepository)
      : super(
          const ThursdayExerciseState(),
        );

  final DocumentsRepository _documentsRepository;

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await _documentsRepository.addexercise3(exerciseName, series, repeat);
      emit(const ThursdayExerciseState(saved: true));
    } catch (error) {
      emit(ThursdayExerciseState(errorMessage: error.toString()));
    }
  }
}
