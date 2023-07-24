import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/models/forum_model.dart';

class ForumRepository {
  Stream<List<ForumModel>> getPostsStream() {
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
          return ForumModel(
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

    String? avatarUrl = await ForumRepository().getLatestImage();

    FirebaseFirestore.instance.collection("UsersPosts").add({
      'UserEmail': currentUser.email,
      'Message': textController,
      'TimeStamp': Timestamp.now(),
      'Likes': [],
      'AvatarUrl': avatarUrl,
    });
  }

  Future<String?> getLatestImage() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }

    final userImageSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("images")
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    if (userImageSnapshot.docs.isNotEmpty) {
      return userImageSnapshot.docs[0].get('downloadURL') as String;
    }

    return null;
  }
}
