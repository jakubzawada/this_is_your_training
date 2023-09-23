// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumModel _$ForumModelFromJson(Map<String, dynamic> json) => ForumModel(
      id: json['id'] as String,
      avatarURL: json['AvatarUrl'] as String,
      likes: (json['Likes'] as List<dynamic>).map((e) => e as String).toList(),
      message: json['Message'] as String,
      timeStamp: ForumModel._timestampFromJson(json['TimeStamp']),
      userEmail: json['UserEmail'] as String,
    );

Map<String, dynamic> _$ForumModelToJson(ForumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'AvatarUrl': instance.avatarURL,
      'Likes': instance.likes,
      'Message': instance.message,
      'TimeStamp': ForumModel._timestampToJson(instance.timeStamp),
      'UserEmail': instance.userEmail,
    };
