// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForumState {
  List<ForumModel> get docs => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForumStateCopyWith<ForumState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumStateCopyWith<$Res> {
  factory $ForumStateCopyWith(
          ForumState value, $Res Function(ForumState) then) =
      _$ForumStateCopyWithImpl<$Res, ForumState>;
  @useResult
  $Res call({List<ForumModel> docs, bool isLoading, String errorMessage});
}

/// @nodoc
class _$ForumStateCopyWithImpl<$Res, $Val extends ForumState>
    implements $ForumStateCopyWith<$Res> {
  _$ForumStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docs = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      docs: null == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<ForumModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForumStateCopyWith<$Res>
    implements $ForumStateCopyWith<$Res> {
  factory _$$_ForumStateCopyWith(
          _$_ForumState value, $Res Function(_$_ForumState) then) =
      __$$_ForumStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ForumModel> docs, bool isLoading, String errorMessage});
}

/// @nodoc
class __$$_ForumStateCopyWithImpl<$Res>
    extends _$ForumStateCopyWithImpl<$Res, _$_ForumState>
    implements _$$_ForumStateCopyWith<$Res> {
  __$$_ForumStateCopyWithImpl(
      _$_ForumState _value, $Res Function(_$_ForumState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docs = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_ForumState(
      docs: null == docs
          ? _value._docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<ForumModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForumState implements _ForumState {
  _$_ForumState(
      {final List<ForumModel> docs = const [],
      this.isLoading = false,
      this.errorMessage = ''})
      : _docs = docs;

  final List<ForumModel> _docs;
  @override
  @JsonKey()
  List<ForumModel> get docs {
    if (_docs is EqualUnmodifiableListView) return _docs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_docs);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'ForumState(docs: $docs, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForumState &&
            const DeepCollectionEquality().equals(other._docs, _docs) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_docs), isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForumStateCopyWith<_$_ForumState> get copyWith =>
      __$$_ForumStateCopyWithImpl<_$_ForumState>(this, _$identity);
}

abstract class _ForumState implements ForumState {
  factory _ForumState(
      {final List<ForumModel> docs,
      final bool isLoading,
      final String errorMessage}) = _$_ForumState;

  @override
  List<ForumModel> get docs;
  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ForumStateCopyWith<_$_ForumState> get copyWith =>
      throw _privateConstructorUsedError;
}
