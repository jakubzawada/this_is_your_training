import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  PostCubit()
      : super(
          PostState(
            docs: const [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start({
    required String postId,
  }) async {
    emit(
      PostState(
        docs: const [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .collection("Comments")
        .orderBy("CommentTime", descending: true)
        .snapshots()
        .listen((data) {
      emit(
        PostState(
          docs: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          PostState(
            docs: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> like({
    required String postId,
    required bool isLiked,
  }) async {
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('UsersPosts').doc(postId);

    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  Future<void> addComment({
    required String postId,
    required String commentText,
  }) async {
    FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .collection("Comments")
        .add({
      "CommentText": commentText,
      "CommentedBy": currentUser.email,
      "CommentTime": Timestamp.now()
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
