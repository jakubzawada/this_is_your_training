import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/data/forum_data_sources/my_account_remote_data_source.dart';
import 'package:this_is_your_training/repositories/my_account_repository.dart';

class ProfilePicture2 extends StatelessWidget {
  final double radius;

  const ProfilePicture2({
    Key? key,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }

    final imagesStream =
        MyAccountRepository(MyAccountRemoteDataSource()).getLatestImageStream();

    return CircleAvatar(
      radius: radius,
      child: StreamBuilder<String?>(
        stream: imagesStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Wystąpił błąd: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final imageUrl = snapshot.data;
          if (imageUrl == null) {
            return const CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              radius: 100,
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            );
          }
          return Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
