import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/post_model.dart';
import 'package:this_is_your_training/repositories/post_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_cubit.freezed.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  bool _isDisposed = false;

  @override
  Future<void> close() async {
    _isDisposed = true;
    super.close();
  }

  PostCubit({required this.postRepository})
      : super(
          PostState(),
        );
  final PostRepository postRepository;

  Future<void> start({
    required String postId,
  }) async {
    emit(
      PostState(
        status: Status.loading,
      ),
    );
    try {
      getPost(postId);
    } catch (error) {
      emit(PostState(
        status: Status.error,
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
    try {
      postRepository.like(postId: postId, isLiked: isLiked);
    } catch (error) {
      emit(
        PostState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> addComment({
    required String postId,
    required String commentText,
  }) async {
    try {
      await postRepository.addComment(postId: postId, commentText: commentText);
      refreshPost(postId: postId);
      emit(
        PostState(saved: true),
      );
    } catch (error) {
      emit(
        PostState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> refreshPost({required String postId}) async {
    try {
      if (!_isDisposed) {
        getPost(postId);
      }
    } catch (error) {
      if (!_isDisposed) {
        emit(
          PostState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      }
    }
  }

  Future<void> postDelete({required String postId}) async {
    try {
      await postRepository.postDelete(postId: postId);
      emit(
        PostState(saved: true),
      );
    } catch (error) {
      emit(
        PostState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getPost(String postId) async {
    try {
      if (!_isDisposed) {
        final postData = await postRepository.getPostData(postId);
        emit(
          PostState(
            status: Status.succes,
            avatarUrl: postData.avatarUrl,
            docs: postData.comments,
            isLiked: postData.isLiked,
          ),
        );
      }
    } catch (error) {
      if (!_isDisposed) {
        emit(PostState(
          status: Status.error,
          errorMessage: error.toString(),
        ));
      }
    }
  }
}
