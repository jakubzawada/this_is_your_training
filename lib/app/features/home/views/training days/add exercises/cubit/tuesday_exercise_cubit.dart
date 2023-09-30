import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tuesday_exercise_cubit.freezed.dart';
part 'tuesday_exercise_state.dart';

class TuesdayExerciseCubit extends Cubit<TuesdayExerciseState> {
  TuesdayExerciseCubit({required this.documentsRepository})
      : super(
          TuesdayExerciseState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> uploadName1(String newValue) async {
    emit(TuesdayExerciseState(
      exerciseName1: newValue,
      series1: state.series1,
      repeat1: state.repeat1,
    ));
  }

  Future<void> uploadSeries1(int? newVal) async {
    emit(TuesdayExerciseState(
      series1: newVal,
      exerciseName1: state.exerciseName1,
      repeat1: state.repeat1,
    ));
  }

  Future<void> uploadRepeat1(int? newVal) async {
    emit(TuesdayExerciseState(
      repeat1: newVal,
      exerciseName1: state.exerciseName1,
      series1: state.series1,
    ));
  }

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await documentsRepository.addexercise1(exerciseName, series, repeat);
      emit(TuesdayExerciseState(saved: true));
    } catch (error) {
      emit(TuesdayExerciseState(errorMessage: error.toString()));
    }
  }
}
