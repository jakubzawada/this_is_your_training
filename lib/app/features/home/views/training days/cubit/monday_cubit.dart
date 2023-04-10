import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'monday_state.dart';

class MondayCubit extends Cubit<MondayState> {
  MondayCubit()
      : super(
          const MondayState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  Future<void> dissmisible({
    required String documentid,
  }) async {
    FirebaseFirestore.instance.collection('trainings').doc(documentid).delete();
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const MondayState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('trainings')
        .snapshots()
        .listen((data) {
      emit(
        MondayState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          MondayState(
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
