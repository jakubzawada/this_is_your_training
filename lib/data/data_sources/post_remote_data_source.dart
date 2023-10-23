import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
