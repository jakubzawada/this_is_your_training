import 'package:this_is_your_training/components/cubit/post_cubit.dart';
import 'package:this_is_your_training/data/forum_data_sources/post_remote_data_source.dart';

class PostRepository {
  final PostRemoteDataSource _postDataSource;

  PostRepository(this._postDataSource);

  Future<void> like({
    required String postId,
    required bool isLiked,
  }) async {
    await _postDataSource.like(postId: postId, isLiked: isLiked);
  }

  Future<PostState> getPost(String postId) async {
    return _postDataSource.getPost(postId);
  }

  Future<void> addComment({
    required String postId,
    required String commentText,
  }) async {
    await _postDataSource.addComment(postId: postId, commentText: commentText);
  }

  Future<void> postDelete({required String postId}) async {
    await _postDataSource.postDelete(postId: postId);
  }
}
