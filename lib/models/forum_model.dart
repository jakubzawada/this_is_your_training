import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forum_model.g.dart';

@JsonSerializable()
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

  @JsonKey(name: 'AvatarUrl')
  final String avatarURL;

  @JsonKey(name: 'Likes')
  final List<String> likes;

  @JsonKey(name: 'Message')
  final String message;

  @JsonKey(
      name: 'TimeStamp', fromJson: _timestampFromJson, toJson: _timestampToJson)
  @TimestampConverter()
  final Timestamp timeStamp;

  static Timestamp _timestampFromJson(json) =>
      Timestamp(json.seconds, json.nanoseconds);

  static int _timestampToJson(Timestamp object) =>
      object.millisecondsSinceEpoch;

  @JsonKey(name: 'UserEmail')
  final String userEmail;

  factory ForumModel.fromJson(Map<String, dynamic> json) =>
      _$ForumModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForumModelToJson(this);
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
