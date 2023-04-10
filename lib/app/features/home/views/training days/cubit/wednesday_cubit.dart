import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'wednesday_state.dart';

class WednesdayCubit extends Cubit<WednesdayState> {
  WednesdayCubit()
      : super(
          const WednesdayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  Future<void> dissmisible({
    required String documentid,
  }) async {
    FirebaseFirestore.instance
        .collection('trainings2')
        .doc(documentid)
        .delete();
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

    _streamSubscription = FirebaseFirestore.instance
        .collection('trainings2')
        .snapshots()
        .listen((data) {
      emit(
        WednesdayState(
          documents: data.docs,
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
