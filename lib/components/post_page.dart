import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/components/comment.dart';
import 'package:this_is_your_training/components/comment_button.dart';
import 'package:this_is_your_training/components/cubit/post_cubit.dart';
import 'package:this_is_your_training/components/like_button.dart';
import 'package:this_is_your_training/components/profile_picture.dart';
import 'package:this_is_your_training/data/forum_data_sources/post_remote_data_source.dart';
import 'package:this_is_your_training/helper/date_helper_methods.dart';
import 'package:this_is_your_training/repositories/post_repository.dart';

class PostPage extends StatelessWidget {
  final String message;
  final String user;
  final String time;
  final String postId;
  final List<String> likes;
  final String avatarUrl;
  PostPage({
    super.key,
    required this.message,
    required this.user,
    required this.time,
    required this.postId,
    required this.likes,
    required this.avatarUrl,
  });

  final _commentTextContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(PostRepository(PostRemoteDataSource()))
        ..start(postId: postId),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        ProfilePicture(
                          radius: 20,
                          avatarUrl: avatarUrl,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              user,
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                        Text(
                          time,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          message,
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
                              if (user == state.currentUser.email) {
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
                                      BlocProvider(
                                        create: (context) => PostCubit(
                                            PostRepository(
                                                PostRemoteDataSource())),
                                        child:
                                            BlocBuilder<PostCubit, PostState>(
                                          builder: (context, state) {
                                            return TextButton(
                                              onPressed: () async {
                                                context
                                                    .read<PostCubit>()
                                                    .postDelete(postId: postId);

                                                Navigator.pop(context);
                                              },
                                              child: const Text('Delete'),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: state.currentUser.email == user
                                ? Icon(
                                    Icons.cancel,
                                    color: Colors.grey[500],
                                  )
                                : Container(),
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
                          isLiked: state.isLiked,
                          onTap: () {
                            context
                                .read<PostCubit>()
                                .postlike(isLiked: state.isLiked);
                            context.read<PostCubit>().like(
                                  isLiked: !state.isLiked,
                                  postId: postId,
                                );
                          },
                        ),
                        const SizedBox(width: 5),
                        Text(
                          likes.length.toString(),
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
                                _commentTextContoller.clear();
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                            BlocProvider(
                              create: (context) => PostCubit(
                                  PostRepository(PostRemoteDataSource())),
                              child: BlocBuilder<PostCubit, PostState>(
                                builder: (context, state) {
                                  return TextButton(
                                    onPressed: () {
                                      context.read<PostCubit>().addComment(
                                            postId: postId,
                                            commentText:
                                                _commentTextContoller.text,
                                          );
                                      _commentTextContoller.clear();
                                      Navigator.pop(context);
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

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.docs.length,
                      itemBuilder: (context, index) {
                        final postModel = state.docs[index];

                        return Comment(
                          text: postModel.commentText,
                          user: postModel.commentedBy,
                          time: formatDate(postModel.commentTime),
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    context.read<PostCubit>().refreshPost(postId: postId);
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
