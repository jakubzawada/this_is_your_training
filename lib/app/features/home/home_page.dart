import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:this_is_your_training/app/features/home/views/step_counter_page.dart';
import 'package:this_is_your_training/app/features/home/views/forum_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/my_account_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training_page_content.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  final today = DateTime.now();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) {}
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return ForumPageContent(email: widget.user.email);
        }
        if (currentIndex == 1) {
          return const TrainingPageContent();
        }
        if (currentIndex == 2) {
          return const StepCounterScreen();
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: const Color.fromARGB(255, 140, 74, 253),
        color: Colors.deepPurpleAccent,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (newindex) {
          setState(() {
            currentIndex = newindex;
          });
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.fitness_center,
            color: Colors.white,
          ),
          Icon(
            Icons.directions_run,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
