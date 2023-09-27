import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friday_exercise_cubit.freezed.dart';
part 'friday_exercise_state.dart';

class FridayExerciseCubit extends Cubit<FridayExerciseState> {
  FridayExerciseCubit(this._documentsRepository)
      : super(
          FridayExerciseState(),
        );

  final TrainingsDocumentsRepository _documentsRepository;

  Future<void> uploadName4(String newValue) async {
    emit(FridayExerciseState(
      exerciseName4: newValue,
      series4: state.series4,
      repeat4: state.repeat4,
    ));
  }

  Future<void> uploadSeries4(int? newVal) async {
    emit(FridayExerciseState(
      series4: newVal,
      exerciseName4: state.exerciseName4,
      repeat4: state.repeat4,
    ));
  }

  Future<void> uploadRepeat4(int? newVal) async {
    emit(FridayExerciseState(
      repeat4: newVal,
      exerciseName4: state.exerciseName4,
      series4: state.series4,
    ));
  }

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await _documentsRepository.addexercise4(exerciseName, series, repeat);
      emit(FridayExerciseState(saved: true));
    } catch (error) {
      emit(FridayExerciseState(errorMessage: error.toString()));
    }
  }
}
