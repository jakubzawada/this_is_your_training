import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_model.freezed.dart';
part 'forum_model.g.dart';

@freezed
class ForumModel with _$ForumModel {
  factory ForumModel(
    String id,
    @JsonKey(name: 'AvatarUrl') String avatarURL,
    @JsonKey(name: 'Likes') List<String> likes,
    @JsonKey(name: 'Message') String message,
    @JsonKey(
      name: 'TimeStamp',
    )
    @TimestampSerializer()
    DateTime timeStamp,
    @JsonKey(name: 'UserEmail') String userEmail,
  ) = _ForumModel;

  factory ForumModel.fromJson(Map<String, dynamic> json) =>
      _$ForumModelFromJson(json);
}

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}


// @JsonSerializable()
// class ForumModel {
//   ForumModel({
//     required this.id,
//     required this.avatarURL,
//     required this.likes,
//     required this.message,
//     required this.timeStamp,
//     required this.userEmail,
//   });

//   final String id;

//   @JsonKey(name: 'AvatarUrl')
//   final String avatarURL;

//   @JsonKey(name: 'Likes')
//   final List<String> likes;

//   @JsonKey(name: 'Message')
//   final String message;

//   @JsonKey(
//       name: 'TimeStamp', fromJson: _timestampFromJson, toJson: _timestampToJson)
//   @TimestampSerializer()
//   final Timestamp timeStamp;

//   static Timestamp _timestampFromJson(json) =>
//       Timestamp(json.seconds, json.nanoseconds);

//   static int _timestampToJson(Timestamp object) =>
//       object.millisecondsSinceEpoch;

//   @JsonKey(name: 'UserEmail')
//   final String userEmail;

//   factory ForumModel.fromJson(Map<String, dynamic> json) =>
//       _$ForumModelFromJson(json);

//   Map<String, dynamic> toJson() => _$ForumModelToJson(this);
// }

