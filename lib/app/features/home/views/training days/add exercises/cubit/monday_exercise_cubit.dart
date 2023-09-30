import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'monday_exercise_cubit.freezed.dart';
part 'monday_exercise_state.dart';

class MondayExerciseCubit extends Cubit<MondayExerciseState> {
  MondayExerciseCubit({required this.documentsRepository})
      : super(
          MondayExerciseState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> uploadName(String newValue) async {
    emit(MondayExerciseState(
      exerciseName: newValue,
      series: state.series,
      repeat: state.repeat,
    ));
  }

  Future<void> uploadSeries(int? newVal) async {
    emit(MondayExerciseState(
      series: newVal,
      exerciseName: state.exerciseName,
      repeat: state.repeat,
    ));
  }

  Future<void> uploadRepeat(int? newVal) async {
    emit(MondayExerciseState(
      repeat: newVal,
      exerciseName: state.exerciseName,
      series: state.series,
    ));
  }

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await documentsRepository.addexercise(exerciseName, series, repeat);
      emit(MondayExerciseState(saved: true));
    } catch (error) {
      emit(MondayExerciseState(errorMessage: error.toString()));
    }
  }
}
