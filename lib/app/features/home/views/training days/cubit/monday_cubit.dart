import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'monday_cubit.freezed.dart';
part 'monday_state.dart';

@injectable
class MondayCubit extends Cubit<MondayState> {
  MondayCubit({required this.documentsRepository})
      : super(
          MondayState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> dismissible({
    required String documentid,
  }) async {
    try {
      await documentsRepository.delete(id: documentid);
    } catch (error) {
      emit(
        MondayState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      MondayState(
        status: Status.loading,
      ),
    );
    try {
      _streamSubscription =
          documentsRepository.getDocumentsStream().listen((results) {
        emit(
          MondayState(
            status: Status.succes,
            results: results,
          ),
        );
      });
    } catch (error) {
      emit(
        MondayState(
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
