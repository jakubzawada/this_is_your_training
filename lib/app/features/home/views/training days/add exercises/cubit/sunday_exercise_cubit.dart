import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sunday_exercise_cubit.freezed.dart';
part 'sunday_exercise_state.dart';

class SundayExerciseCubit extends Cubit<SundayExerciseState> {
  SundayExerciseCubit({required this.documentsRepository})
      : super(
          SundayExerciseState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

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
      await documentsRepository.addexercise6(exerciseName, series, repeat);
      emit(SundayExerciseState(saved: true));
    } catch (error) {
      emit(SundayExerciseState(errorMessage: error.toString()));
    }
  }
}
