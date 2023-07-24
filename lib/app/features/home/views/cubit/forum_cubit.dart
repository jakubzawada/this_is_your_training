import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/models/forum_model.dart';
import 'package:this_is_your_training/repositories/forum_repository.dart';

part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  String? avatarUrl;
  ForumCubit(this._postRepository, {this.avatarUrl})
      : super(
          const ForumState(
            docs: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final ForumRepository _postRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ForumState(
        docs: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = _postRepository.getPostsStream().listen((data) {
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
    await _postRepository.postMessage(textController: textController);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
