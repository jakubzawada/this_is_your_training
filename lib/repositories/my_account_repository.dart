import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MyAccountRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImage(File selectedImage) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('users/$userId/images')
        .child("post_$postID");
    await ref.putFile(selectedImage);
    String downloadURL = await ref.getDownloadURL();

    await firebaseFirestore
        .collection("users")
        .doc(userId)
        .collection("images")
        .add({
      'downloadURL': downloadURL,
      'timestamp': FieldValue.serverTimestamp(),
    });
    return downloadURL;
  }

  Future<void> updatePostsWithNewAvatar(String? newAvatarUrl) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final postsCollection = FirebaseFirestore.instance.collection('UsersPosts');

    final userPostsSnapshot = await postsCollection
        .where('UserEmail', isEqualTo: currentUser.email)
        .get();

    for (final postDoc in userPostsSnapshot.docs) {
      await postDoc.reference.update({
        'AvatarUrl': newAvatarUrl,
      });
    }
  }

  Future<void> deleteAccount() async {
    await _auth.currentUser?.delete();
  }
}
