import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sunday_cubit.freezed.dart';
part 'sunday_state.dart';

@injectable
class SundayCubit extends Cubit<SundayState> {
  SundayCubit({required this.documentsRepository})
      : super(
          SundayState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> dismissible({
    required String documentid,
  }) async {
    try {
      await documentsRepository.delete6(id: documentid);
    } catch (error) {
      emit(
        SundayState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      SundayState(
        status: Status.loading,
      ),
    );

    try {
      _streamSubscription =
          documentsRepository.getDocumentsStream6().listen((results) {
        emit(
          SundayState(
            status: Status.succes,
            results: results,
          ),
        );
      });
    } catch (error) {
      emit(
        SundayState(
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
