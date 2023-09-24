// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'forum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ForumModel _$$_ForumModelFromJson(Map<String, dynamic> json) =>
    _$_ForumModel(
      json['id'] as String,
      json['AvatarUrl'] as String,
      (json['Likes'] as List<dynamic>).map((e) => e as String).toList(),
      json['Message'] as String,
      const TimestampSerializer().fromJson(json['TimeStamp']),
      json['UserEmail'] as String,
    );

Map<String, dynamic> _$$_ForumModelToJson(_$_ForumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'AvatarUrl': instance.avatarURL,
      'Likes': instance.likes,
      'Message': instance.message,
      'TimeStamp': const TimestampSerializer().toJson(instance.timeStamp),
      'UserEmail': instance.userEmail,
    };
