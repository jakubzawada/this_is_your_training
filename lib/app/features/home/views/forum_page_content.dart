import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/forum_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/my_account_cubit.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'package:this_is_your_training/components/post_page.dart';
import 'package:this_is_your_training/helper/date_helper_methods.dart';
import 'package:this_is_your_training/app/features/widgets/forum_page/post_textfield.dart';

class ForumPageContent extends StatelessWidget {
  ForumPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  final textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyAccountCubit>(
      create: (context) => getIt(),
      child: BlocProvider<ForumCubit>(
        create: (context) => getIt()..start(),
        child: BlocBuilder<ForumCubit, ForumState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                title: const Text(
                  'Forum',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 140, 74, 253),
                      Color.fromARGB(255, 134, 67, 250),
                      Color.fromARGB(255, 143, 78, 254),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: BlocBuilder<ForumCubit, ForumState>(
                          builder: (context, state) {
                            if (state.results.isNotEmpty) {
                              return LiquidPullToRefresh(
                                onRefresh: () async {
                                  context.read<ForumCubit>().handleRefresh();
                                },
                                color: Colors.deepPurple,
                                height: 250,
                                backgroundColor:
                                    const Color.fromARGB(255, 140, 74, 253),
                                animSpeedFactor: 2,
                                showChildOpacityTransition: false,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  reverse: false,
                                  itemCount: state.results.length,
                                  itemBuilder: (context, index) {
                                    final postModel = state.results[index];
                                    String formattedTime = formatDate(
                                        Timestamp.fromDate(
                                            postModel.timeStamp));
                                    return PostPage(
                                      message: postModel.message,
                                      user: postModel.userEmail,
                                      postId: postModel.id,
                                      likes: List<String>.from(postModel.likes),
                                      time: formattedTime,
                                      avatarUrl: postModel.avatarURL,
                                    );
                                  },
                                ),
                              );
                            } else if (state.errorMessage.isNotEmpty) {
                              return Center(
                                child: Text(
                                    'Something went wrong: ${state.errorMessage}'),
                              );
                            }
                            if (state.status == Status.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Center(
                              child: Text(
                                  'Something went wrong: ${state.errorMessage}'),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          bottom: 20,
                          right: 20,
                          left: 25,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child:
                                  PostTextField(textController: textController),
                            ),
                            IconButton(
                              onPressed: () {
                                if (textController.text.isNotEmpty) {
                                  context.read<ForumCubit>().postMessage(
                                      textController: textController.text);
                                  _scrollController.jumpTo(_scrollController
                                      .position.maxScrollExtent);
                                }
                                FocusScope.of(context).unfocus();
                                textController.clear();
                              },
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
          },
        ),
      ),
    );
  }
}
