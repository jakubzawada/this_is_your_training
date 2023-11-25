// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      json['CommentText'] as String,
      const TimestampSerializer().fromJson(json['CommentTime']),
      json['CommentedBy'] as String,
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'CommentText': instance.commentText,
      'CommentTime': const TimestampSerializer().toJson(instance.commentTime),
      'CommentedBy': instance.commentedBy,
    };
