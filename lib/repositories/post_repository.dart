import 'package:this_is_your_training/data/forum_data_sources/post_remote_data_source.dart';

class PostRepository {
  final PostRemoteDataSource postDataSource;

  PostRepository({required this.postDataSource});

  Future<void> like({
    required String postId,
    required bool isLiked,
  }) async {
    await postDataSource.like(postId: postId, isLiked: isLiked);
  }

  Future<void> addComment({
    required String postId,
    required String commentText,
  }) async {
    await postDataSource.addComment(postId: postId, commentText: commentText);
  }

  Future<void> postDelete({required String postId}) async {
    await postDataSource.postDelete(postId: postId);
  }
}
