// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumModelImpl _$$ForumModelImplFromJson(Map<String, dynamic> json) =>
    _$ForumModelImpl(
      json['id'] as String,
      json['AvatarUrl'] as String,
      (json['Likes'] as List<dynamic>).map((e) => e as String).toList(),
      json['Message'] as String,
      const TimestampSerializer().fromJson(json['TimeStamp']),
      json['UserEmail'] as String,
    );

Map<String, dynamic> _$$ForumModelImplToJson(_$ForumModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'AvatarUrl': instance.avatarURL,
      'Likes': instance.likes,
      'Message': instance.message,
      'TimeStamp': const TimestampSerializer().toJson(instance.timeStamp),
      'UserEmail': instance.userEmail,
    };
