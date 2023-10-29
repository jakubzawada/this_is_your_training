// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'post2_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel2 _$$_PostModel2FromJson(Map<String, dynamic> json) =>
    _$_PostModel2(
      json['AvatarUrl'] as String,
      (json['Comments'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['IsLiked'] as bool,
    );

Map<String, dynamic> _$$_PostModel2ToJson(_$_PostModel2 instance) =>
    <String, dynamic>{
      'AvatarUrl': instance.avatarUrl,
      'Comments': instance.comments,
      'IsLiked': instance.isLiked,
    };
