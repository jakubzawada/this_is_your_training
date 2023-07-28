import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/components/cubit/post_cubit.dart';
import 'package:this_is_your_training/models/post_model.dart';

class PostRepository {
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

  Future<PostState> getPost(String postId) async {
    try {
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

      List<PostModel> comments = commentDocs
          .map((doc) => PostModel.fromDocumentSnapshot(doc))
          .toList();

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
        docs: comments,
        isLiked: isLiked,
        isLoading: false,
        errorMessage: '',
        avatarUrl: avatarUrl,
      );
    } catch (error) {
      return PostState(
        docs: const [],
        isLiked: false,
        isLoading: false,
        errorMessage: error.toString(),
        avatarUrl: '',
      );
    }
  }

  Future<PostModel> addComment({
    required String postId,
    required String commentText,
  }) async {
    final newCommentData = {
      "CommentText": commentText,
      "CommentedBy": currentUser.email,
      "CommentTime": Timestamp.now(),
    };

    // Dodaj nowy komentarz do kolekcji komentarzy
    final newCommentRef = await FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .collection("Comments")
        .add(newCommentData);

    // Pobierz dodany komentarz
    final newCommentSnapshot = await newCommentRef.get();

    // Utwórz nowy obiekt PostModel używając nowego komentarza
    final newComment = PostModel.fromDocumentSnapshot(newCommentSnapshot);

    return newComment;
  }
}
