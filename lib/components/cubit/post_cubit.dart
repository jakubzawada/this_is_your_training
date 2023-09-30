import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/models/post_model.dart';
import 'package:this_is_your_training/repositories/post_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_cubit.freezed.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({required this.postRepository})
      : super(
          PostState(
            docs: const [],
            errorMessage: '',
            isLoading: false,
            avatarUrl: '',
          ),
        );
  final PostRepository postRepository;

  Future<void> start({
    required String postId,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      getPost(postId);
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
    postRepository.like(postId: postId, isLiked: isLiked);
  }

  Future<void> addComment({
    required String postId,
    required String commentText,
  }) async {
    try {
      await postRepository.addComment(postId: postId, commentText: commentText);
      refreshPost(postId: postId);
      emit(
        state.copyWith(saved: true),
      );
    } catch (error) {
      emit(state.copyWith(errorMessage: error.toString()));
    }
  }

  Future<void> refreshPost({required String postId}) async {
    try {
      getPost(postId);
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> postDelete({required String postId}) async {
    try {
      await postRepository.postDelete(postId: postId);
      emit(
        state.copyWith(saved: true),
      );
    } catch (error) {
      emit(state.copyWith(errorMessage: error.toString()));
    }
  }

  Future<void> getPost(String postId) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
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

    List<PostModel> comments =
        commentDocs.map((doc) => PostModel.fromDocumentSnapshot(doc)).toList();

    String userId = postSnapshot['UserEmail'];
    QuerySnapshot userImageSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("images")
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    String avatarUrl = '';
    if (userImageSnapshot.docs.isNotEmpty) {
      avatarUrl = userImageSnapshot.docs[0].get('downloadURL') as String;
    }

    emit(
      PostState(
        isLoading: false,
        errorMessage: '',
        avatarUrl: avatarUrl,
        docs: comments,
        isLiked: isLiked,
      ),
    );
  }
}
