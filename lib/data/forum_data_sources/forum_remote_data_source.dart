import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForumDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getPostsData() {
    return FirebaseFirestore.instance
        .collection("UsersPosts")
        .orderBy(
          "TimeStamp",
          descending: false,
        )
        .snapshots();
  }

  Future<void> postMessage({
    required String textController,
    required String avatarUrl,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser!;

    await FirebaseFirestore.instance.collection("UsersPosts").add({
      'UserEmail': currentUser.email,
      'Message': textController,
      'TimeStamp': Timestamp.now(),
      'Likes': [],
      'AvatarUrl': avatarUrl,
    });
  }

  Future<String?> getLatestImage(String userId) async {
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
