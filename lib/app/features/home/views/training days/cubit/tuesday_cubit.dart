import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/document_model.dart';

part 'tuesday_state.dart';

class TuesdayCubit extends Cubit<TuesdayState> {
  TuesdayCubit()
      : super(
          const TuesdayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  Future<void> dissmisible({
    required String documentid,
  }) async {
    FirebaseFirestore.instance
        .collection('trainings1')
        .doc(documentid)
        .delete();
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

    _streamSubscription = FirebaseFirestore.instance
        .collection('trainings1')
        .snapshots()
        .listen((data) {
      final documentModels = data.docs.map((doc) {
        return DocumentModel(
          id: doc.id,
          name: doc['name1'],
          series: doc['series1'],
          repeat: doc['repeat1'],
        );
      }).toList();
      emit(
        TuesdayState(
          documents: documentModels,
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
