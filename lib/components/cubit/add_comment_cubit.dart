import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit(this._documentsRepository) : super(AddCommentState());

  final DocumentsRepository _documentsRepository;

  Future<void> addComment({
    required String postId,
    required String commentText,
  }) async {
    _documentsRepository.addComment(postId: postId, commentText: commentText);
  }
}
