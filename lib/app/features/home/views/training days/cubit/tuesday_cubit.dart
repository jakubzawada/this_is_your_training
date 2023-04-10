import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

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
      emit(
        TuesdayState(
          documents: data.docs,
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
