import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/document_model.dart';
part 'friday_state.dart';

class FridayCubit extends Cubit<FridayState> {
  FridayCubit()
      : super(
          const FridayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  Future<void> dissmisible({
    required String documentid,
  }) async {
    FirebaseFirestore.instance
        .collection('trainings4')
        .doc(documentid)
        .delete();
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

    _streamSubscription = FirebaseFirestore.instance
        .collection('trainings4')
        .snapshots()
        .listen((data) {
      final documentModels = data.docs.map((doc) {
        return DocumentModel(
          id: doc.id,
          name: doc['name4'],
          series: doc['series4'],
          repeat: doc['repeat4'],
        );
      }).toList();
      emit(
        FridayState(
          documents: documentModels,
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
