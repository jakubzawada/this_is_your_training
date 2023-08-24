import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/components/cubit/post_cubit.dart';
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

// getpsot

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
