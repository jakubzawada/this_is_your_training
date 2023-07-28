import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

part 'post_delete_state.dart';

class PostDeleteCubit extends Cubit<PostDeleteState> {
  PostDeleteCubit(this._documentsRepository) : super(PostDeleteState());

  final DocumentsRepository _documentsRepository;

  Future<void> postDelete({required String postId}) async {
    await _documentsRepository.postDelete(postId: postId);
  }
}
