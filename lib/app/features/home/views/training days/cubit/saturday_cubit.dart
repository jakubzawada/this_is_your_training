import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/document_model.dart';
part 'saturday_state.dart';

class SaturdayCubit extends Cubit<SaturdayState> {
  SaturdayCubit()
      : super(
          const SaturdayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  Future<void> dissmisible({
    required String documentid,
  }) async {
    FirebaseFirestore.instance
        .collection('trainings5')
        .doc(documentid)
        .delete();
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

    _streamSubscription = FirebaseFirestore.instance
        .collection('trainings5')
        .snapshots()
        .listen((data) {
      final documentModels = data.docs.map((doc) {
        return DocumentModel(
          id: doc.id,
          name: doc['name5'],
          series: doc['series5'],
          repeat: doc['repeat5'],
        );
      }).toList();
      emit(
        SaturdayState(
          documents: documentModels,
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
