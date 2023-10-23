import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/data/data_sources/post_remote_data_source.dart';
import 'package:this_is_your_training/models/post2_model.dart';
import 'package:this_is_your_training/models/post_model.dart';

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

  Future<PostModel2> getPostData(String postId) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
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

    List<PostModel> comments = commentDocs
        .map((doc) => PostModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return PostModel2(
      avatarUrl: avatarUrl,
      comments: comments,
      isLiked: isLiked,
    );
  }
}
