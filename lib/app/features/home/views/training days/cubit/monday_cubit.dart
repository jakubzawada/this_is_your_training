import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
part 'monday_state.dart';

class MondayCubit extends Cubit<MondayState> {
  MondayCubit(this._documentsRepository)
      : super(
          const MondayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final TrainingsDocumentsRepository _documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await _documentsRepository.delete(id: documentid);
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const MondayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        _documentsRepository.getDocumentsStream().listen((data) {
      emit(
        MondayState(
          documents: data,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              MondayState(
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
