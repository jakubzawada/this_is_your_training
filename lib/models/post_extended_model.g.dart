// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_extended_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelExtendedImpl _$$PostModelExtendedImplFromJson(
        Map<String, dynamic> json) =>
    _$PostModelExtendedImpl(
      json['AvatarUrl'] as String,
      (json['Comments'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['IsLiked'] as bool,
    );

Map<String, dynamic> _$$PostModelExtendedImplToJson(
        _$PostModelExtendedImpl instance) =>
    <String, dynamic>{
      'AvatarUrl': instance.avatarUrl,
      'Comments': instance.comments,
      'IsLiked': instance.isLiked,
    };
