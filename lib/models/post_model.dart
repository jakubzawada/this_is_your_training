import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:this_is_your_training/widgets/timestampserializer.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel(
    @JsonKey(name: 'CommentText') String commentText,
    @JsonKey(name: 'CommentTime') @TimestampSerializer() DateTime commentTime,
    @JsonKey(name: 'CommentedBy') String commentedBy,
  ) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
