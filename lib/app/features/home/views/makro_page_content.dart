import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:this_is_your_training/components/forum_page.dart';
import 'package:this_is_your_training/components/text_field.dart';

class MakroPageContent extends StatefulWidget {
  const MakroPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  State<MakroPageContent> createState() => _MakroPageContentState();
}

class _MakroPageContentState extends State<MakroPageContent> {
  // text controller
  final textController = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser!;

  // post message
  void postMessage() {
    // only post if there is something in the thextfield
    if (textController.text.isNotEmpty) {
      //store in firebase
      FirebaseFirestore.instance.collection("UsersPosts").add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
      });
    }

    // clear the textfield
    FocusScope.of(context).unfocus();
    textController.clear();
  }

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
              // the wall
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("UsersPosts")
                      .orderBy(
                        "TimeStamp",
                        descending: false,
                      )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final QuerySnapshot querySnapshot =
                          snapshot.data! as QuerySnapshot;

                      return ListView.builder(
                        itemCount: querySnapshot.docs.length,
                        itemBuilder: (context, index) {
                          // get the message
                          final post = querySnapshot.docs[index];
                          return ForumPage(
                            message: post['Message'],
                            user: post['UserEmail'],
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error:${snapshot.error}'),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),

              // post message
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    // textfield
                    Expanded(
                      child: MyTextField(
                        controller: textController,
                        hintText: 'Napisz coś na forum..',
                        obscureText: false,
                      ),
                    ),

                    // post button
                    IconButton(
                      onPressed: postMessage,
                      icon: const Icon(Icons.arrow_circle_up),
                    ),
                  ],
                ),
              ),

              // logged in as
              Text(
                'Zalogowany jako: ${widget.email}',
                style: TextStyle(color: Colors.deepPurple[200]),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
