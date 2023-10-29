// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  @JsonKey(name: 'CommentText')
  String get commentText => throw _privateConstructorUsedError;
  @JsonKey(name: 'CommentTime')
  @TimestampSerializer()
  DateTime get commentTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'CommentedBy')
  String get commentedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CommentText') String commentText,
      @JsonKey(name: 'CommentTime') @TimestampSerializer() DateTime commentTime,
      @JsonKey(name: 'CommentedBy') String commentedBy});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentText = null,
    Object? commentTime = null,
    Object? commentedBy = null,
  }) {
    return _then(_value.copyWith(
      commentText: null == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String,
      commentTime: null == commentTime
          ? _value.commentTime
          : commentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      commentedBy: null == commentedBy
          ? _value.commentedBy
          : commentedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$$_PostModelCopyWith(
          _$_PostModel value, $Res Function(_$_PostModel) then) =
      __$$_PostModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CommentText') String commentText,
      @JsonKey(name: 'CommentTime') @TimestampSerializer() DateTime commentTime,
      @JsonKey(name: 'CommentedBy') String commentedBy});
}

/// @nodoc
class __$$_PostModelCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$_PostModel>
    implements _$$_PostModelCopyWith<$Res> {
  __$$_PostModelCopyWithImpl(
      _$_PostModel _value, $Res Function(_$_PostModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentText = null,
    Object? commentTime = null,
    Object? commentedBy = null,
  }) {
    return _then(_$_PostModel(
      null == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String,
      null == commentTime
          ? _value.commentTime
          : commentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == commentedBy
          ? _value.commentedBy
          : commentedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostModel implements _PostModel {
  _$_PostModel(
      @JsonKey(name: 'CommentText') this.commentText,
      @JsonKey(name: 'CommentTime') @TimestampSerializer() this.commentTime,
      @JsonKey(name: 'CommentedBy') this.commentedBy);

  factory _$_PostModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostModelFromJson(json);

  @override
  @JsonKey(name: 'CommentText')
  final String commentText;
  @override
  @JsonKey(name: 'CommentTime')
  @TimestampSerializer()
  final DateTime commentTime;
  @override
  @JsonKey(name: 'CommentedBy')
  final String commentedBy;

  @override
  String toString() {
    return 'PostModel(commentText: $commentText, commentTime: $commentTime, commentedBy: $commentedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostModel &&
            (identical(other.commentText, commentText) ||
                other.commentText == commentText) &&
            (identical(other.commentTime, commentTime) ||
                other.commentTime == commentTime) &&
            (identical(other.commentedBy, commentedBy) ||
                other.commentedBy == commentedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, commentText, commentTime, commentedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      __$$_PostModelCopyWithImpl<_$_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostModelToJson(
      this,
    );
  }
}

abstract class _PostModel implements PostModel {
  factory _PostModel(
      @JsonKey(name: 'CommentText') final String commentText,
      @JsonKey(name: 'CommentTime')
      @TimestampSerializer()
      final DateTime commentTime,
      @JsonKey(name: 'CommentedBy') final String commentedBy) = _$_PostModel;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$_PostModel.fromJson;

  @override
  @JsonKey(name: 'CommentText')
  String get commentText;
  @override
  @JsonKey(name: 'CommentTime')
  @TimestampSerializer()
  DateTime get commentTime;
  @override
  @JsonKey(name: 'CommentedBy')
  String get commentedBy;
  @override
  @JsonKey(ignore: true)
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
