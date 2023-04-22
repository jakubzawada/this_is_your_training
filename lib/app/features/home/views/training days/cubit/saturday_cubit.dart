import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/document_model.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';
part 'saturday_state.dart';

class SaturdayCubit extends Cubit<SaturdayState> {
  SaturdayCubit(this._documentsRepository)
      : super(
          const SaturdayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final DocumentsRepository _documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await _documentsRepository.delete5(id: documentid);
  }

   StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const SaturdayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        _documentsRepository.getDocumentsStream5().listen((data) {
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
