import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friday_cubit.freezed.dart';
part 'friday_state.dart';

@injectable
class FridayCubit extends Cubit<FridayState> {
  FridayCubit({required this.documentsRepository})
      : super(
          FridayState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      FridayState(
        status: Status.loading,
      ),
    );
    try {
      _streamSubscription =
          documentsRepository.getDocumentsStream4().listen((results) {
        emit(
          FridayState(
            status: Status.succes,
            results: results,
          ),
        );
      });
    } catch (error) {
      emit(
        FridayState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> dismissible({
    required String documentid,
  }) async {
    try {
      await documentsRepository.delete4(id: documentid);
    } catch (error) {
      emit(
        FridayState(
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
