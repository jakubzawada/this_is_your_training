import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'thursday_exercise_cubit.freezed.dart';
part 'thursday_exercise_state.dart';

class ThursdayExerciseCubit extends Cubit<ThursdayExerciseState> {
  ThursdayExerciseCubit(this._documentsRepository)
      : super(
          ThursdayExerciseState(),
        );

  final TrainingsDocumentsRepository _documentsRepository;

  Future<void> uploadName3(String newValue) async {
    emit(ThursdayExerciseState(
      exerciseName3: newValue,
      series3: state.series3,
      repeat3: state.repeat3,
    ));
  }

  Future<void> uploadSeries3(int? newVal) async {
    emit(ThursdayExerciseState(
      series3: newVal,
      exerciseName3: state.exerciseName3,
      repeat3: state.repeat3,
    ));
  }

  Future<void> uploadRepeat3(int? newVal) async {
    emit(ThursdayExerciseState(
      repeat3: newVal,
      exerciseName3: state.exerciseName3,
      series3: state.series3,
    ));
  }

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await _documentsRepository.addexercise3(exerciseName, series, repeat);
      emit(ThursdayExerciseState(saved: true));
    } catch (error) {
      emit(ThursdayExerciseState(errorMessage: error.toString()));
    }
  }
}
