import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/components/comment.dart';
import 'package:this_is_your_training/components/comment_button.dart';
import 'package:this_is_your_training/components/cubit/add_comment_cubit.dart';
import 'package:this_is_your_training/components/cubit/post_cubit.dart';
import 'package:this_is_your_training/components/like_button.dart';
import 'package:this_is_your_training/components/profile_picture.dart';
import 'package:this_is_your_training/helper/date_helper_methods.dart';

class PostPage extends StatefulWidget {
  final String message;
  final String user;
  final String time;
  final String postId;
  final List<String> likes;
  const PostPage({
    super.key,
    required this.message,
    required this.user,
    required this.time,
    required this.postId,
    required this.likes,
  });

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  final _commentTextContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit()..start(postId: widget.postId),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                    const Column(
                      children: [
                        ProfilePicture(radius: 20),
                        SizedBox(height: 30),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.user,
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                        Text(
                          widget.time,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.message,
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (widget.user == currentUser.email) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Delete"),
                                    content: const Text("Are you sure?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          final commentDocs =
                                              await FirebaseFirestore.instance
                                                  .collection("UsersPosts")
                                                  .doc(widget.postId)
                                                  .collection("Comments")
                                                  .get();

                                          for (var doc in commentDocs.docs) {
                                            await doc.reference.delete();
                                          }

                                          FirebaseFirestore.instance
                                              .collection("UsersPosts")
                                              .doc(widget.postId)
                                              .delete()
                                              // ignore: avoid_print
                                              .then((value) =>
                                                  // ignore: avoid_print
                                                  print('post deleted'))
                                              .catchError(
                                                  // ignore: avoid_print
                                                  (error) => print(
                                                      'failed to delete post: $error'));

                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Icon(
                              Icons.cancel,
                              color: Colors.grey[500],
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        LikeButton(
                          isLiked: isLiked,
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                            context
                                .read<PostCubit>()
                                .like(isLiked: isLiked, postId: widget.postId);
                          },
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.likes.length.toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    CommentButton(onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Add Comment"),
                          content: TextField(
                            controller: _commentTextContoller,
                            decoration: const InputDecoration(
                                hintText: "Write a comment.."),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _commentTextContoller.clear();
                              },
                              child: const Text("Cancel"),
                            ),
                            BlocProvider(
                              create: (context) => AddCommentCubit(),
                              child:
                                  BlocBuilder<AddCommentCubit, AddCommentState>(
                                builder: (context, state) {
                                  return TextButton(
                                    onPressed: () {
                                      (String commentText) {
                                        context
                                            .read<AddCommentCubit>()
                                            .addComment(
                                                postId: widget.postId,
                                                commentText: commentText);
                                      }(_commentTextContoller.text);
                                      Navigator.pop(context);

                                      _commentTextContoller.clear();
                                    },
                                    child: const Text("Post"),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    if (state.errorMessage.isNotEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: state.docs.map((doc) {
                        final commentData = doc.data() as Map<String, dynamic>;

                        return Comment(
                          text: commentData["CommentText"],
                          user: commentData["CommentedBy"],
                          time: formatDate(commentData["CommentTime"]),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
