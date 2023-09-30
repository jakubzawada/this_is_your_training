import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friday_cubit.freezed.dart';
part 'friday_state.dart';

class FridayCubit extends Cubit<FridayState> {
  FridayCubit({required this.documentsRepository})
      : super(
          FridayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await documentsRepository.delete4(id: documentid);
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      FridayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        documentsRepository.getDocumentsStream4().listen((data) {
      emit(
        FridayState(
          documents: data,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              FridayState(
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
