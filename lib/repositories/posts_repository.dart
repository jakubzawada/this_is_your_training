import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/models/post_model.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

class PostRepository {
  Stream<List<PostModel>> getPostsStream() {
    return FirebaseFirestore.instance
        .collection("UsersPosts")
        .orderBy(
          "TimeStamp",
          descending: false,
        )
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return PostModel(
            id: doc.id,
            avatarURL: doc['AvatarUrl'],
            likes: List<String>.from(doc['Likes'] as List<dynamic>),
            message: doc['Message'],
            timeStamp: doc['TimeStamp'],
            userEmail: doc['UserEmail'],
          );
        },
      ).toList();
    });
  }

  Future<void> postMessage({
    required String textController,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser!;

    String? avatarUrl = await DocumentsRepository().getLatestImage();

    FirebaseFirestore.instance.collection("UsersPosts").add({
      'UserEmail': currentUser.email,
      'Message': textController,
      'TimeStamp': Timestamp.now(),
      'Likes': [],
      'AvatarUrl': avatarUrl,
    });
  }
}
