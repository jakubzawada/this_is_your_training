import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/document_model.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';
part 'thursday_state.dart';

class ThursdayCubit extends Cubit<ThursdayState> {
  ThursdayCubit(this._documentsRepository)
      : super(
          const ThursdayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final DocumentsRepository _documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await _documentsRepository.delete3(id: documentid);
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ThursdayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        _documentsRepository.getDocumentsStream3().listen((data) {
      emit(
        ThursdayState(
          documents: data,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              ThursdayState(
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
