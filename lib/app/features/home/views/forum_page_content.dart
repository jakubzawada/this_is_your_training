import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/forum_cubit.dart';
import 'package:this_is_your_training/components/post_page.dart';
import 'package:this_is_your_training/helper/date_helper_methods.dart';

class ForumPageContent extends StatefulWidget {
  const ForumPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  State<ForumPageContent> createState() => _MakroPageContentState();
}

class _MakroPageContentState extends State<ForumPageContent> {
  final textController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Forum',
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 154, 104, 236),
              Color.fromARGB(255, 111, 60, 193),
              Colors.deepPurple,
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: BlocProvider(
                  create: (context) => ForumCubit()..start(),
                  child: BlocBuilder<ForumCubit, ForumState>(
                    builder: (context, state) {
                      if (state.docs.isNotEmpty) {
                        return ListView.builder(
                          itemCount: state.docs.length,
                          itemBuilder: (context, index) {
                            final post = state.docs[index];
                            return PostPage(
                              message: post['Message'],
                              user: post['UserEmail'],
                              postId: post.id,
                              likes: List<String>.from(post['Likes'] ?? []),
                              time: formatDate(post['TimeStamp']),
                            );
                          },
                        );
                      } else if (state.errorMessage.isNotEmpty) {
                        return Center(
                          child: Text(
                              'Something went wrong: ${state.errorMessage}'),
                        );
                      }
                      if (state.isLoading == true) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Center(
                        child:
                            Text('Something went wrong: ${state.errorMessage}'),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: 'Napisz coś na forum..',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                        ),
                        obscureText: false,
                      ),
                    ),
                    IconButton(
                      onPressed: postMessage,
                      icon: Icon(
                        Icons.send,
                        color: Colors.deepPurple[300],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }

  void postMessage() {
    if (textController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("UsersPosts").add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
        'Likes': [],
      });
    }
    FocusScope.of(context).unfocus();
    textController.clear();
  }
}
