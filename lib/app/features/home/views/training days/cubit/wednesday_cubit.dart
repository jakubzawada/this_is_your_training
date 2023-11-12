import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wednesday_cubit.freezed.dart';
part 'wednesday_state.dart';

@injectable
class WednesdayCubit extends Cubit<WednesdayState> {
  WednesdayCubit({required this.documentsRepository})
      : super(
          WednesdayState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      WednesdayState(
        status: Status.loading,
      ),
    );

    try {
      _streamSubscription =
          documentsRepository.getDocumentsStream2().listen((results) {
        emit(
          WednesdayState(
            status: Status.succes,
            results: results,
          ),
        );
      });
    } catch (error) {
      emit(
        WednesdayState(
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
      await documentsRepository.delete2(id: documentid);
      emit(
        state.copyWith(
          status: Status.succes,
        ),
      );
    } catch (error) {
      emit(
        WednesdayState(
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
