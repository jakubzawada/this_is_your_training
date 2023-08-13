import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/components/cubit/post_cubit.dart';
import 'package:this_is_your_training/data/forum_data_sources/post_remote_data_source.dart';
import 'package:this_is_your_training/models/post_model.dart';

class PostRepository {
  final PostRemoteDataSource _postDataSource;
  final currentUser = FirebaseAuth.instance.currentUser!;

  PostRepository(this._postDataSource);

  Future<void> like({
    required String postId,
    required bool isLiked,
  }) async {
    await _postDataSource.like(postId: postId, isLiked: isLiked);
  }

  Future<PostState> getPost(String postId) async {
    DocumentSnapshot postSnapshot = await FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .get();

    bool isLiked =
        (postSnapshot['Likes'] as List<dynamic>).contains(currentUser.email);

    QuerySnapshot commentsSnapshot = await FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .collection("Comments")
        .orderBy("CommentTime", descending: true)
        .get();

    List<DocumentSnapshot> commentDocs = commentsSnapshot.docs;

    List<PostModel> comments = // postmodel
        commentDocs.map((doc) => PostModel.fromDocumentSnapshot(doc)).toList();

    String userId = postSnapshot['UserEmail'];
    QuerySnapshot userImageSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("images")
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    String avatarUrl = '';
    if (userImageSnapshot.docs.isNotEmpty) {
      avatarUrl = userImageSnapshot.docs[0].get('downloadURL') as String;
    }

    return PostState(
      docs: comments, // postmodel
      isLiked: isLiked,
      isLoading: false,
      errorMessage: '',
      avatarUrl: avatarUrl,
    );
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
