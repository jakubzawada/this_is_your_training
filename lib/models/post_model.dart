import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  PostModel({
    required this.commentText,
    required this.commentTime,
    required this.commentedBy,
  });

  @JsonKey(name: 'CommentText')
  final String commentText;

  @JsonKey(name: 'CommentTime')
  @TimestampSerializer()
  final DateTime commentTime;

  @JsonKey(name: 'CommentedBy')
  final String commentedBy;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
