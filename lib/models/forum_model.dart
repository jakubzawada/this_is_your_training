import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:this_is_your_training/components/timestampserializer.dart';

part 'forum_model.freezed.dart';
part 'forum_model.g.dart';

@freezed
class ForumModel with _$ForumModel {
  factory ForumModel(
    String id,
    @JsonKey(name: 'AvatarUrl') String avatarURL,
    @JsonKey(name: 'Likes') List<String> likes,
    @JsonKey(name: 'Message') String message,
    @JsonKey(name: 'TimeStamp') @TimestampSerializer() DateTime timeStamp,
    @JsonKey(name: 'UserEmail') String userEmail,
  ) = _ForumModel;

  factory ForumModel.fromJson(Map<String, dynamic> json) =>
      _$ForumModelFromJson(json);
}
