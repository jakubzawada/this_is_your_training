import 'package:this_is_your_training/models/post_model.dart';

class PostModel2 {
  PostModel2({
    required this.avatarUrl,
    required this.comments,
    required this.isLiked,
  });
  final String avatarUrl;
  final List<PostModel> comments;
  final bool isLiked;

  PostModel2.fromJson(Map<String, dynamic> json)
      : avatarUrl = json['AvatarUrl'],
        comments = (json['Comments'] as List).map((commentJson) {
          return PostModel(
            commentText: commentJson['CommentText'],
            commentTime: commentJson['CommentTime'],
            commentedBy: commentJson['CommentedBy'],
          );
        }).toList(),
        isLiked = json['IsLiked'];
}
