import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'thursday_cubit.freezed.dart';
part 'thursday_state.dart';

@injectable
class ThursdayCubit extends Cubit<ThursdayState> {
  ThursdayCubit({required this.documentsRepository})
      : super(
          ThursdayState(),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> dismissible({
    required String documentid,
  }) async {
    try {
      await documentsRepository.delete3(id: documentid);
    } catch (error) {
      emit(
        ThursdayState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      ThursdayState(
        status: Status.loading,
      ),
    );

    try {
      _streamSubscription =
          documentsRepository.getDocumentsStream3().listen((results) {
        emit(
          ThursdayState(
            status: Status.succes,
            results: results,
          ),
        );
      });
    } catch (error) {
      emit(
        ThursdayState(
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
