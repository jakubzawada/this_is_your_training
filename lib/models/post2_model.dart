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
}
