import 'package:json_annotation/json_annotation.dart';
import 'package:this_is_your_training/models/post_model.dart';

part 'post2_model.g.dart';

@JsonSerializable()
class PostModel2 {
  PostModel2({
    required this.avatarUrl,
    required this.comments,
    required this.isLiked,
  });

  @JsonKey(name: 'AvatarUrl')
  final String avatarUrl;

  @JsonKey(name: 'Comments')
  final List<PostModel> comments;

  @JsonKey(name: 'IsLiked')
  final bool isLiked;

  factory PostModel2.fromJson(Map<String, dynamic> json) =>
      _$PostModel2FromJson(json);

  Map<String, dynamic> toJson() => _$PostModel2ToJson(this);
}
