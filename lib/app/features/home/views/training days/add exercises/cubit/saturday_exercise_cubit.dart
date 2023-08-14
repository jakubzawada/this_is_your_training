import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

part 'saturday_exercise_state.dart';

class SaturdayExerciseCubit extends Cubit<SaturdayExerciseState> {
  SaturdayExerciseCubit(this._documentsRepository)
      : super(
          const SaturdayExerciseState(),
        );

  final TrainingsDocumentsRepository _documentsRepository;

  Future<void> uploadName5(String newValue) async {
    emit(SaturdayExerciseState(
      exerciseName5: newValue,
      series5: state.series5,
      repeat5: state.repeat5,
    ));
  }

  Future<void> uploadSeries5(int? newVal) async {
    emit(SaturdayExerciseState(
      series5: newVal,
      exerciseName5: state.exerciseName5,
      repeat5: state.repeat5,
    ));
  }

  Future<void> uploadRepeat5(int? newVal) async {
    emit(SaturdayExerciseState(
      repeat5: newVal,
      exerciseName5: state.exerciseName5,
      series5: state.series5,
    ));
  }

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
