import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/training_model.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
part 'wednesday_state.dart';

class WednesdayCubit extends Cubit<WednesdayState> {
  WednesdayCubit(this._documentsRepository)
      : super(
          const WednesdayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final TrainingsDocumentsRepository _documentsRepository;

  Future<void> dissmisible({
    required String documentid,
  }) async {
    await _documentsRepository.delete2(id: documentid);
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const WednesdayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription =
        _documentsRepository.getDocumentsStream2().listen((data) {
      emit(
        WednesdayState(
          documents: data,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              WednesdayState(
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
