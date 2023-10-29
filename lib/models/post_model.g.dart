// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      json['CommentText'] as String,
      const TimestampSerializer().fromJson(json['CommentTime']),
      json['CommentedBy'] as String,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'CommentText': instance.commentText,
      'CommentTime': const TimestampSerializer().toJson(instance.commentTime),
      'CommentedBy': instance.commentedBy,
    };
