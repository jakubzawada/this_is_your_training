import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/document_model.dart';

part 'thursday_state.dart';

class ThursdayCubit extends Cubit<ThursdayState> {
  ThursdayCubit()
      : super(
          const ThursdayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  Future<void> dissmisible({
    required String documentid,
  }) async {
    FirebaseFirestore.instance
        .collection('trainings3')
        .doc(documentid)
        .delete();
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

    _streamSubscription = FirebaseFirestore.instance
        .collection('trainings3')
        .snapshots()
        .listen((data) {
      final documentModels = data.docs.map((doc) {
        return DocumentModel(
          id: doc.id,
          name: doc['name3'],
          series: doc['series3'],
          repeat: doc['repeat3'],
        );
      }).toList();
      emit(
        ThursdayState(
          documents: documentModels,
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
