import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:this_is_your_training/components/like_button.dart';
import 'package:this_is_your_training/components/profile_picture.dart';

class ForumPage extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;
  const ForumPage({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
  });

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  // user
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  // toogle like
  void toogleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    // Access the document is Firebase
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('UsersPosts').doc(widget.postId);

    if (isLiked) {
      // if the post is now liked, add the user's email to the 'Likes' field
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      // if the post is now unliked, remove the user's email from the 'Likes' field
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: [
              LikeButton(
                isLiked: isLiked,
                onTap: toogleLike,
              ),

              const SizedBox(height: 5),

              // like count
              Text(
                widget.likes.length.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user,
                style: TextStyle(color: Colors.grey[500]),
              ),
              const SizedBox(height: 10),
              Text(widget.message),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: ProfilePicture(radius: 20),
          ),
        ],
      ),
    );
  }
}
