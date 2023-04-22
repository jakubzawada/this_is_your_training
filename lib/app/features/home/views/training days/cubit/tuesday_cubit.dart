import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/document_model.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';
part 'tuesday_state.dart';

class TuesdayCubit extends Cubit<TuesdayState> {
  TuesdayCubit(this._documentsRepository)
      : super(
          const TuesdayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final DocumentsRepository _documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await _documentsRepository.delete1(id: documentid);
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const TuesdayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        _documentsRepository.getDocumentsStream1().listen((data) {
      emit(
        TuesdayState(
          documents: data,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              TuesdayState(
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
