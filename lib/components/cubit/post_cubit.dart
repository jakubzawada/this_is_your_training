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
            avatarUrl: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start({
    required String postId,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      DocumentSnapshot postSnapshot = await FirebaseFirestore.instance
          .collection("UsersPosts")
          .doc(postId)
          .get();

      bool isLiked =
          (postSnapshot['Likes'] as List<dynamic>).contains(currentUser.email);

      QuerySnapshot commentsSnapshot = await FirebaseFirestore.instance
          .collection("UsersPosts")
          .doc(postId)
          .collection("Comments")
          .orderBy("CommentTime", descending: true)
          .get();

      List<DocumentSnapshot> commentDocs = commentsSnapshot.docs;

      String userId = postSnapshot['UserEmail']; // Pobierz userId autora postu
      QuerySnapshot userImageSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("images")
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();

      String avatarUrl = '';
      if (userImageSnapshot.docs.isNotEmpty) {
        // Sprawdź, czy dokumenty istnieją przed próbą pobrania danych
        avatarUrl = userImageSnapshot.docs[0].get('downloadURL') as String;
      }

      emit(state.copyWith(
        docs: commentDocs,
        isLiked: isLiked,
        isLoading: false,
        errorMessage: '',
        avatarUrl: avatarUrl, // Dodaj URL avatara autora postu do stanu.
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> postlike({required bool isLiked}) async {
    emit(state.copyWith(isLiked: !state.isLiked));
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
    final newCommentData = {
      "CommentText": commentText,
      "CommentedBy": currentUser.email,
      "CommentTime": Timestamp.now(),
    };

    // Dodaj nowy komentarz do kolekcji komentarzy
    final newCommentRef = await FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .collection("Comments")
        .add(newCommentData);

    // Pobierz dodany komentarz
    final newCommentSnapshot = await newCommentRef.get();

    // Zaktualizuj stan komentarzy poprzez dodanie nowego komentarza
    emit(state.copyWith(
      docs: [...state.docs, newCommentSnapshot],
    ));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
