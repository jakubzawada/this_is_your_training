import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tuesday_cubit.freezed.dart';
part 'tuesday_state.dart';

@injectable
class TuesdayCubit extends Cubit<TuesdayState> {
  TuesdayCubit({required this.documentsRepository})
      : super(
          TuesdayState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> dismissible({
    required String documentid,
  }) async {
    try {
      await documentsRepository.delete1(id: documentid);
    } catch (error) {
      emit(
        TuesdayState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      TuesdayState(
        status: Status.loading,
      ),
    );

    try {
      _streamSubscription =
          documentsRepository.getDocumentsStream1().listen((results) {
        emit(
          TuesdayState(
            status: Status.succes,
            results: results,
          ),
        );
      });
    } catch (error) {
      emit(
        TuesdayState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
