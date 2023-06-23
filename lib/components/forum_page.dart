import 'package:flutter/material.dart';
import 'package:this_is_your_training/components/profile_picture.dart';

class ForumPage extends StatelessWidget {
  final String message;
  final String user;
  const ForumPage({
    super.key,
    required this.message,
    required this.user,
  });

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
          // profile pic
          const ProfilePicture(radius: 25),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user,
                style: TextStyle(color: Colors.grey[500]),
              ),
              const SizedBox(height: 10),
              Text(message),
            ],
          ),
        ],
      ),
    );
  }
}
