import 'package:flutter/material.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePicture extends StatefulWidget {
  final double radius;

  const ProfilePicture({
    Key? key,
    required this.radius,
  }) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  late Stream<String?> imagesStream;

  @override
  void initState() {
    super.initState();
    imagesStream = DocumentsRepository().getLatestImageStream();
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return CircleAvatar(
      radius: widget.radius,
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
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            );
          }
          return Container(
            width: widget.radius * 2,
            height: widget.radius * 2,
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
