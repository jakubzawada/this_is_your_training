import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wednesday_exercise_cubit.freezed.dart';
part 'wednesday_exercise_state.dart';

@injectable
class WednesdayExerciseCubit extends Cubit<WednesdayExerciseState> {
  WednesdayExerciseCubit({required this.documentsRepository})
      : super(
          WednesdayExerciseState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> uploadName2(String newValue) async {
    emit(WednesdayExerciseState(
      exerciseName2: newValue,
      series2: state.series2,
      repeat2: state.repeat2,
    ));
  }

  Future<void> uploadSeries2(int? newVal) async {
    emit(WednesdayExerciseState(
      series2: newVal,
      exerciseName2: state.exerciseName2,
      repeat2: state.repeat2,
    ));
  }

  Future<void> uploadRepeat2(int? newVal) async {
    emit(WednesdayExerciseState(
      repeat2: newVal,
      exerciseName2: state.exerciseName2,
      series2: state.series2,
    ));
  }

  Future<void> addexercise({
    required String exerciseName,
    required int series,
    required int repeat,
  }) async {
    try {
      await documentsRepository.addexercise2(exerciseName, series, repeat);
      emit(WednesdayExerciseState(saved: true));
    } catch (error) {
      emit(WednesdayExerciseState(errorMessage: error.toString()));
    }
  }
}
