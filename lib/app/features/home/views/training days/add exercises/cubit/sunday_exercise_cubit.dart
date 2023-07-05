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

  Future<void> uploadName6(String newValue) async {
    emit(SundayExerciseState(
      exerciseName6: newValue,
      series6: state.series6,
      repeat6: state.repeat6,
    ));
  }

  Future<void> uploadSeries6(int? newVal) async {
    emit(SundayExerciseState(
      series6: newVal,
      exerciseName6: state.exerciseName6,
      repeat6: state.repeat6,
    ));
  }

  Future<void> uploadRepeat6(int? newVal) async {
    emit(SundayExerciseState(
      repeat6: newVal,
      exerciseName6: state.exerciseName6,
      series6: state.series6,
    ));
  }

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
