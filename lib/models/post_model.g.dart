// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      commentText: json['CommentText'] as String,
      commentTime: const TimestampSerializer().fromJson(json['CommentTime']),
      commentedBy: json['CommentedBy'] as String,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'CommentText': instance.commentText,
      'CommentTime': const TimestampSerializer().toJson(instance.commentTime),
      'CommentedBy': instance.commentedBy,
    };
