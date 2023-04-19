import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/document_model.dart';

part 'sunday_state.dart';

class SundayCubit extends Cubit<SundayState> {
  SundayCubit()
      : super(
          const SundayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  Future<void> dissmisible({
    required String documentid,
  }) async {
    FirebaseFirestore.instance
        .collection('trainings6')
        .doc(documentid)
        .delete();
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

    _streamSubscription = FirebaseFirestore.instance
        .collection('trainings6')
        .snapshots()
        .listen((data) {
      final documentModels = data.docs.map((doc) {
        return DocumentModel(
          id: doc.id,
          name: doc['name6'],
          series: doc['series6'],
          repeat: doc['repeat6'],
        );
      }).toList();
      emit(
        SundayState(
          documents: documentModels,
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
