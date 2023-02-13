import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:this_is_your_training/app/home/views/makro_page_content.dart';
import 'package:this_is_your_training/app/home/views/my_account_page_content.dart';
import 'package:this_is_your_training/app/home/views/taining_page_content.dart';

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
          return const MakroPageContent();
        }
        if (currentIndex == 1) {
          return const TrainingPageContent();
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.deepPurple,
        color: Colors.deepPurple.shade200,
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
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
