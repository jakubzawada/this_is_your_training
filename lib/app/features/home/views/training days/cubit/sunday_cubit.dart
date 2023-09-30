import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sunday_cubit.freezed.dart';
part 'sunday_state.dart';

class SundayCubit extends Cubit<SundayState> {
  SundayCubit({required this.documentsRepository})
      : super(
          SundayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final TrainingsDocumentsRepository documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await documentsRepository.delete6(id: documentid);
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      SundayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        documentsRepository.getDocumentsStream6().listen((data) {
      emit(
        SundayState(
          documents: data,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              SundayState(
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
