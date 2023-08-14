import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
part 'sunday_state.dart';

class SundayCubit extends Cubit<SundayState> {
  SundayCubit(this._documentsRepository)
      : super(
          const SundayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final TrainingsDocumentsRepository _documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await _documentsRepository.delete6(id: documentid);
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const SundayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        _documentsRepository.getDocumentsStream6().listen((data) {
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
