import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/forum_model.dart';
import 'package:this_is_your_training/repositories/forum_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_cubit.freezed.dart';
part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  String? avatarUrl;
  ForumCubit({required this.forumRepository, this.avatarUrl})
      : super(ForumState());

  final ForumRepository forumRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      ForumState(
        status: Status.loading,
      ),
    );
    try {
      _streamSubscription = forumRepository.getPostsStream().listen((results) {
        emit(
          ForumState(
            status: Status.succes,
            results: results,
          ),
        );
      });
    } catch (error) {
      emit(
        ForumState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> postMessage({
    required String textController,
  }) async {
    await forumRepository.postMessage(textController: textController);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
