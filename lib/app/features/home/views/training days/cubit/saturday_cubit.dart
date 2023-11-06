import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saturday_cubit.freezed.dart';
part 'saturday_state.dart';

@injectable
class SaturdayCubit extends Cubit<SaturdayState> {
  SaturdayCubit({required this.documentsRepository})
      : super(
          SaturdayState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      SaturdayState(
        status: Status.loading,
      ),
    );

    try {
      _streamSubscription =
          documentsRepository.getDocumentsStream5().listen((results) {
        emit(
          SaturdayState(
            status: Status.succes,
            results: results,
          ),
        );
      });
    } catch (error) {
      emit(
        SaturdayState(
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
      await documentsRepository.delete5(id: documentid);
    } catch (error) {
      emit(
        SaturdayState(
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
