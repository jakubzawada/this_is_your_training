import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/models/forum_model.dart';
import 'package:this_is_your_training/repositories/forum_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_cubit.freezed.dart';
part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  String? avatarUrl;
  ForumCubit(this._forumRepository, {this.avatarUrl})
      : super(
          ForumState(
            docs: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final ForumRepository _forumRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      ForumState(
        docs: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = _forumRepository.getPostsStream().listen((data) {
      emit(
        ForumState(
          docs: data,
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
    await _forumRepository.postMessage(textController: textController);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
