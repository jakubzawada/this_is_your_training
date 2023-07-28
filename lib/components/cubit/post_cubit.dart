import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/post_model.dart';
import 'package:this_is_your_training/repositories/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._postRepository)
      : super(
          PostState(
            docs: const [],
            errorMessage: '',
            isLoading: false,
            avatarUrl: '',
          ),
        );
  final PostRepository _postRepository;

  Future<void> start({
    required String postId,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      PostState postState = await _postRepository.getPost(postId);
      emit(postState);
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
    _postRepository.like(postId: postId, isLiked: isLiked);
  }

  Future<void> addComment({
    required String postId,
    required String commentText,
  }) async {
    try {
      PostModel newComment = await _postRepository.addComment(
        postId: postId,
        commentText: commentText,
      );

      emit(state.copyWith(
        docs: [...state.docs, newComment],
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }
}
