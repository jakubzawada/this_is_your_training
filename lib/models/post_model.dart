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

  factory PostModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PostModel(
      commentText: data['CommentText'],
      commentTime: data['CommentTime'],
      commentedBy: data['CommentedBy'],
    );
  }
}
