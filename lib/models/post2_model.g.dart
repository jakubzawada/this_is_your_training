// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post2_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel2 _$PostModel2FromJson(Map<String, dynamic> json) => PostModel2(
      avatarUrl: json['AvatarUrl'] as String,
      comments: (json['Comments'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLiked: json['IsLiked'] as bool,
    );

Map<String, dynamic> _$PostModel2ToJson(PostModel2 instance) =>
    <String, dynamic>{
      'AvatarUrl': instance.avatarUrl,
      'Comments': instance.comments,
      'IsLiked': instance.isLiked,
    };
