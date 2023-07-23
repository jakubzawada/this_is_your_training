import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/post_model.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  String? avatarUrl;
  ForumCubit({this.avatarUrl})
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
      final postModels = data.docs.map((doc) {
        return PostModel(
          id: doc.id,
          avatarURL: doc['AvatarUrl'],
          likes: List<String>.from(doc['Likes'] as List<dynamic>),
          message: doc['Message'],
          timeStamp: doc['TimeStamp'],
          userEmail: doc['UserEmail'],
        );
      }).toList();
      emit(
        ForumState(
          docs: postModels,
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
    required String textController,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser!;

    String? avatarUrl = await DocumentsRepository().getLatestImage();

    FirebaseFirestore.instance.collection("UsersPosts").add({
      'UserEmail': currentUser.email,
      'Message': textController,
      'TimeStamp': Timestamp.now(),
      'Likes': [],
      'AvatarUrl': avatarUrl,
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
