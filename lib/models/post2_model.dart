import 'package:this_is_your_training/models/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post2_model.freezed.dart';
part 'post2_model.g.dart';

@freezed
class PostModel2 with _$PostModel2 {
  factory PostModel2(
    @JsonKey(name: 'AvatarUrl') String avatarUrl,
    @JsonKey(name: 'Comments') List<PostModel> comments,
    @JsonKey(name: 'IsLiked') bool isLiked,
  ) = _PostModel2;

  factory PostModel2.fromJson(Map<String, dynamic> json) =>
      _$PostModel2FromJson(json);
}
