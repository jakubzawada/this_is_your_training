import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/models/forum_model.dart';
import 'package:this_is_your_training/repositories/forum_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_cubit.freezed.dart';
part 'forum_state.dart';

@injectable
class ForumCubit extends Cubit<ForumState> {
  ForumCubit({
    required this.forumRepository,
  }) : super(ForumState());

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
    try {
      await forumRepository.postMessage(textController: textController);
      emit(
        state.copyWith(
          status: Status.succes,
        ),
      );
    } catch (error) {
      emit(
        ForumState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
