import 'package:this_is_your_training/models/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post2_model.freezed.dart';
part 'post2_model.g.dart';

@freezed
class PostModelExtended with _$PostModelExtended {
  factory PostModelExtended(
    @JsonKey(name: 'AvatarUrl') String avatarUrl,
    @JsonKey(name: 'Comments') List<PostModel> comments,
    @JsonKey(name: 'IsLiked') bool isLiked,
  ) = _PostModelExtended;

  factory PostModelExtended.fromJson(Map<String, dynamic> json) =>
      _$PostModelExtendedFromJson(json);
}
