import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/data/data_sources/post_remote_data_source.dart';
import 'package:this_is_your_training/models/post_extended_model.dart';

@injectable
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

  Future<PostModelExtended> getPostData(String postId) async {
    final json = await postDataSource.getPostData(postId);

    return PostModelExtended.fromJson(json);
  }
}
