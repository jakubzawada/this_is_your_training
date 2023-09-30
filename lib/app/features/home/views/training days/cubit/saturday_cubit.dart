import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saturday_cubit.freezed.dart';
part 'saturday_state.dart';

class SaturdayCubit extends Cubit<SaturdayState> {
  SaturdayCubit({required this.documentsRepository})
      : super(
          SaturdayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await documentsRepository.delete5(id: documentid);
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      SaturdayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        documentsRepository.getDocumentsStream5().listen((data) {
      emit(
        SaturdayState(
          documents: data,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              SaturdayState(
                documents: const [],
                isLoading: false,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
