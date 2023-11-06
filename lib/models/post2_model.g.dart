// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'post2_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModelExtended _$$_PostModelExtendedFromJson(Map<String, dynamic> json) =>
    _$_PostModelExtended(
      json['AvatarUrl'] as String,
      (json['Comments'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['IsLiked'] as bool,
    );

Map<String, dynamic> _$$_PostModelExtendedToJson(
        _$_PostModelExtended instance) =>
    <String, dynamic>{
      'AvatarUrl': instance.avatarUrl,
      'Comments': instance.comments,
      'IsLiked': instance.isLiked,
    };
