import 'package:cloud_firestore/cloud_firestore.dart';

class ForumModel {
  ForumModel({
    required this.id,
    required this.avatarURL,
    required this.likes,
    required this.message,
    required this.timeStamp,
    required this.userEmail,
  });
  final String id;
  final String avatarURL;
  final List<String> likes;
  final String message;
  final Timestamp timeStamp;
  final String userEmail;
}
