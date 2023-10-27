import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/models/post_model.dart';

class PostRemoteDataSource {
  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> like({
    required String postId,
    required bool isLiked,
  }) async {
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('UsersPosts').doc(postId);

    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  Future<void> addComment({
    required String postId,
    required String commentText,
  }) async {
    FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .collection("Comments")
        .add({
      "CommentText": commentText,
      "CommentedBy": currentUser.email,
      "CommentTime": Timestamp.now()
    });
  }

  Future<void> postDelete({required String postId}) async {
    final commentDocs = await FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .collection("Comments")
        .get();

    for (var doc in commentDocs.docs) {
      await doc.reference.delete();
    }

    FirebaseFirestore.instance.collection("UsersPosts").doc(postId).delete();
  }

  Future<Map<String, dynamic>> getPostData(String postId) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final postSnapshot = await FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .get();

    final isLiked =
        (postSnapshot['Likes'] as List<dynamic>).contains(currentUser.email);

    final commentsSnapshot = await FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .collection("Comments")
        .orderBy("CommentTime", descending: true)
        .get();

    final commentDocs = commentsSnapshot.docs;

    final userId = postSnapshot['UserEmail'];
    final userImageSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("images")
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    final avatarUrl = userImageSnapshot.docs.isNotEmpty
        ? userImageSnapshot.docs[0].get('downloadURL') as String
        : '';

    final comments = _extractComments(commentDocs);

    return {
      'AvatarUrl': avatarUrl,
      'Comments': comments
          .map((comment) => {
                'CommentText': comment.commentText,
                'CommentTime': comment.commentTime,
                'CommentedBy': comment.commentedBy,
              })
          .toList(),
      'IsLiked': isLiked,
    };
  }

  List<PostModel> _extractComments(List<DocumentSnapshot> commentDocs) {
    return commentDocs
        .map((doc) => PostModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
