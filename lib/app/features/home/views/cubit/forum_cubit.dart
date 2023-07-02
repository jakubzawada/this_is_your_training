import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  ForumCubit()
      : super(
          const ForumState(
            docs: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ForumState(
        docs: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection("UsersPosts")
        .orderBy(
          "TimeStamp",
          descending: false,
        )
        .snapshots()
        .listen((data) {
      emit(
        ForumState(
          docs: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          ForumState(
            docs: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> postMessage({
    required String currentUser,
    required String textController,
  }) async {
    FirebaseFirestore.instance.collection("UsersPosts").add({
      'UserEmail': currentUser,
      'Message': textController,
      'TimeStamp': Timestamp.now(),
      'Likes': [],
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
