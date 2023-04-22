import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/document_model.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';
part 'friday_state.dart';

class FridayCubit extends Cubit<FridayState> {
  FridayCubit(this._documentsRepository)
      : super(
          const FridayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final DocumentsRepository _documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await _documentsRepository.delete4(id: documentid);
  }


  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const FridayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        _documentsRepository.getDocumentsStream4().listen((data) {
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
