// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_extended_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostModelExtended _$PostModelExtendedFromJson(Map<String, dynamic> json) {
  return _PostModelExtended.fromJson(json);
}

/// @nodoc
mixin _$PostModelExtended {
  @JsonKey(name: 'AvatarUrl')
  String get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'Comments')
  List<PostModel> get comments => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLiked')
  bool get isLiked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelExtendedCopyWith<PostModelExtended> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelExtendedCopyWith<$Res> {
  factory $PostModelExtendedCopyWith(
          PostModelExtended value, $Res Function(PostModelExtended) then) =
      _$PostModelExtendedCopyWithImpl<$Res, PostModelExtended>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AvatarUrl') String avatarUrl,
      @JsonKey(name: 'Comments') List<PostModel> comments,
      @JsonKey(name: 'IsLiked') bool isLiked});
}

/// @nodoc
class _$PostModelExtendedCopyWithImpl<$Res, $Val extends PostModelExtended>
    implements $PostModelExtendedCopyWith<$Res> {
  _$PostModelExtendedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarUrl = null,
    Object? comments = null,
    Object? isLiked = null,
  }) {
    return _then(_value.copyWith(
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostModelExtendedCopyWith<$Res>
    implements $PostModelExtendedCopyWith<$Res> {
  factory _$$_PostModelExtendedCopyWith(_$_PostModelExtended value,
          $Res Function(_$_PostModelExtended) then) =
      __$$_PostModelExtendedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AvatarUrl') String avatarUrl,
      @JsonKey(name: 'Comments') List<PostModel> comments,
      @JsonKey(name: 'IsLiked') bool isLiked});
}

/// @nodoc
class __$$_PostModelExtendedCopyWithImpl<$Res>
    extends _$PostModelExtendedCopyWithImpl<$Res, _$_PostModelExtended>
    implements _$$_PostModelExtendedCopyWith<$Res> {
  __$$_PostModelExtendedCopyWithImpl(
      _$_PostModelExtended _value, $Res Function(_$_PostModelExtended) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarUrl = null,
    Object? comments = null,
    Object? isLiked = null,
  }) {
    return _then(_$_PostModelExtended(
      null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
      null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostModelExtended implements _PostModelExtended {
  _$_PostModelExtended(
      @JsonKey(name: 'AvatarUrl') this.avatarUrl,
      @JsonKey(name: 'Comments') final List<PostModel> comments,
      @JsonKey(name: 'IsLiked') this.isLiked)
      : _comments = comments;

  factory _$_PostModelExtended.fromJson(Map<String, dynamic> json) =>
      _$$_PostModelExtendedFromJson(json);

  @override
  @JsonKey(name: 'AvatarUrl')
  final String avatarUrl;
  final List<PostModel> _comments;
  @override
  @JsonKey(name: 'Comments')
  List<PostModel> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  @JsonKey(name: 'IsLiked')
  final bool isLiked;

  @override
  String toString() {
    return 'PostModelExtended(avatarUrl: $avatarUrl, comments: $comments, isLiked: $isLiked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostModelExtended &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, avatarUrl,
      const DeepCollectionEquality().hash(_comments), isLiked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostModelExtendedCopyWith<_$_PostModelExtended> get copyWith =>
      __$$_PostModelExtendedCopyWithImpl<_$_PostModelExtended>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostModelExtendedToJson(
      this,
    );
  }
}

abstract class _PostModelExtended implements PostModelExtended {
  factory _PostModelExtended(
      @JsonKey(name: 'AvatarUrl') final String avatarUrl,
      @JsonKey(name: 'Comments') final List<PostModel> comments,
      @JsonKey(name: 'IsLiked') final bool isLiked) = _$_PostModelExtended;

  factory _PostModelExtended.fromJson(Map<String, dynamic> json) =
      _$_PostModelExtended.fromJson;

  @override
  @JsonKey(name: 'AvatarUrl')
  String get avatarUrl;
  @override
  @JsonKey(name: 'Comments')
  List<PostModel> get comments;
  @override
  @JsonKey(name: 'IsLiked')
  bool get isLiked;
  @override
  @JsonKey(ignore: true)
  _$$_PostModelExtendedCopyWith<_$_PostModelExtended> get copyWith =>
      throw _privateConstructorUsedError;
}
