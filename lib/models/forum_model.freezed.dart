// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForumModel _$ForumModelFromJson(Map<String, dynamic> json) {
  return _ForumModel.fromJson(json);
}

/// @nodoc
mixin _$ForumModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'AvatarUrl')
  String get avatarURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'Likes')
  List<String> get likes => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeStamp')
  @TimestampSerializer()
  DateTime get timeStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserEmail')
  String get userEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForumModelCopyWith<ForumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumModelCopyWith<$Res> {
  factory $ForumModelCopyWith(
          ForumModel value, $Res Function(ForumModel) then) =
      _$ForumModelCopyWithImpl<$Res, ForumModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'AvatarUrl') String avatarURL,
      @JsonKey(name: 'Likes') List<String> likes,
      @JsonKey(name: 'Message') String message,
      @JsonKey(name: 'TimeStamp') @TimestampSerializer() DateTime timeStamp,
      @JsonKey(name: 'UserEmail') String userEmail});
}

/// @nodoc
class _$ForumModelCopyWithImpl<$Res, $Val extends ForumModel>
    implements $ForumModelCopyWith<$Res> {
  _$ForumModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatarURL = null,
    Object? likes = null,
    Object? message = null,
    Object? timeStamp = null,
    Object? userEmail = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatarURL: null == avatarURL
          ? _value.avatarURL
          : avatarURL // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumModelImplCopyWith<$Res>
    implements $ForumModelCopyWith<$Res> {
  factory _$$ForumModelImplCopyWith(
          _$ForumModelImpl value, $Res Function(_$ForumModelImpl) then) =
      __$$ForumModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'AvatarUrl') String avatarURL,
      @JsonKey(name: 'Likes') List<String> likes,
      @JsonKey(name: 'Message') String message,
      @JsonKey(name: 'TimeStamp') @TimestampSerializer() DateTime timeStamp,
      @JsonKey(name: 'UserEmail') String userEmail});
}

/// @nodoc
class __$$ForumModelImplCopyWithImpl<$Res>
    extends _$ForumModelCopyWithImpl<$Res, _$ForumModelImpl>
    implements _$$ForumModelImplCopyWith<$Res> {
  __$$ForumModelImplCopyWithImpl(
      _$ForumModelImpl _value, $Res Function(_$ForumModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatarURL = null,
    Object? likes = null,
    Object? message = null,
    Object? timeStamp = null,
    Object? userEmail = null,
  }) {
    return _then(_$ForumModelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == avatarURL
          ? _value.avatarURL
          : avatarURL // ignore: cast_nullable_to_non_nullable
              as String,
      null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumModelImpl implements _ForumModel {
  _$ForumModelImpl(
      this.id,
      @JsonKey(name: 'AvatarUrl') this.avatarURL,
      @JsonKey(name: 'Likes') final List<String> likes,
      @JsonKey(name: 'Message') this.message,
      @JsonKey(name: 'TimeStamp') @TimestampSerializer() this.timeStamp,
      @JsonKey(name: 'UserEmail') this.userEmail)
      : _likes = likes;

  factory _$ForumModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'AvatarUrl')
  final String avatarURL;
  final List<String> _likes;
  @override
  @JsonKey(name: 'Likes')
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  @JsonKey(name: 'Message')
  final String message;
  @override
  @JsonKey(name: 'TimeStamp')
  @TimestampSerializer()
  final DateTime timeStamp;
  @override
  @JsonKey(name: 'UserEmail')
  final String userEmail;

  @override
  String toString() {
    return 'ForumModel(id: $id, avatarURL: $avatarURL, likes: $likes, message: $message, timeStamp: $timeStamp, userEmail: $userEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatarURL, avatarURL) ||
                other.avatarURL == avatarURL) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      avatarURL,
      const DeepCollectionEquality().hash(_likes),
      message,
      timeStamp,
      userEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumModelImplCopyWith<_$ForumModelImpl> get copyWith =>
      __$$ForumModelImplCopyWithImpl<_$ForumModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumModelImplToJson(
      this,
    );
  }
}

abstract class _ForumModel implements ForumModel {
  factory _ForumModel(
      final String id,
      @JsonKey(name: 'AvatarUrl') final String avatarURL,
      @JsonKey(name: 'Likes') final List<String> likes,
      @JsonKey(name: 'Message') final String message,
      @JsonKey(name: 'TimeStamp')
      @TimestampSerializer()
      final DateTime timeStamp,
      @JsonKey(name: 'UserEmail') final String userEmail) = _$ForumModelImpl;

  factory _ForumModel.fromJson(Map<String, dynamic> json) =
      _$ForumModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'AvatarUrl')
  String get avatarURL;
  @override
  @JsonKey(name: 'Likes')
  List<String> get likes;
  @override
  @JsonKey(name: 'Message')
  String get message;
  @override
  @JsonKey(name: 'TimeStamp')
  @TimestampSerializer()
  DateTime get timeStamp;
  @override
  @JsonKey(name: 'UserEmail')
  String get userEmail;
  @override
  @JsonKey(ignore: true)
  _$$ForumModelImplCopyWith<_$ForumModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
