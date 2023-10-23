import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  PostModel({
    required this.commentText,
    required this.commentTime,
    required this.commentedBy,
  });

  final String commentText;
  final Timestamp commentTime;
  final String commentedBy;

  PostModel.fromJson(Map<String, dynamic> json)
      : commentText = json['CommentText'],
        commentTime = json['CommentTime'],
        commentedBy = json['CommentedBy'];
}
