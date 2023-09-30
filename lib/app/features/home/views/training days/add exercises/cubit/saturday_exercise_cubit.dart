import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saturday_exercise_cubit.freezed.dart';
part 'saturday_exercise_state.dart';

class SaturdayExerciseCubit extends Cubit<SaturdayExerciseState> {
  SaturdayExerciseCubit({required this.documentsRepository})
      : super(
          SaturdayExerciseState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

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
      await documentsRepository.addexercise5(exerciseName, series, repeat);
      emit(SaturdayExerciseState(saved: true));
    } catch (error) {
      emit(SaturdayExerciseState(errorMessage: error.toString()));
    }
  }
}
