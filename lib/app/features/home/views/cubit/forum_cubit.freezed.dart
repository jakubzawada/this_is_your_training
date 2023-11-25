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
  List<ForumModel> get results => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

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
  $Res call({List<ForumModel> results, String errorMessage, Status status});
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
    Object? results = null,
    Object? errorMessage = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ForumModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumStateImplCopyWith<$Res>
    implements $ForumStateCopyWith<$Res> {
  factory _$$ForumStateImplCopyWith(
          _$ForumStateImpl value, $Res Function(_$ForumStateImpl) then) =
      __$$ForumStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ForumModel> results, String errorMessage, Status status});
}

/// @nodoc
class __$$ForumStateImplCopyWithImpl<$Res>
    extends _$ForumStateCopyWithImpl<$Res, _$ForumStateImpl>
    implements _$$ForumStateImplCopyWith<$Res> {
  __$$ForumStateImplCopyWithImpl(
      _$ForumStateImpl _value, $Res Function(_$ForumStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? errorMessage = null,
    Object? status = null,
  }) {
    return _then(_$ForumStateImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ForumModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$ForumStateImpl implements _ForumState {
  _$ForumStateImpl(
      {final List<ForumModel> results = const [],
      this.errorMessage = '',
      this.status = Status.loading})
      : _results = results;

  final List<ForumModel> _results;
  @override
  @JsonKey()
  List<ForumModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'ForumState(results: $results, errorMessage: $errorMessage, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumStateImpl &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_results), errorMessage, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumStateImplCopyWith<_$ForumStateImpl> get copyWith =>
      __$$ForumStateImplCopyWithImpl<_$ForumStateImpl>(this, _$identity);
}

abstract class _ForumState implements ForumState {
  factory _ForumState(
      {final List<ForumModel> results,
      final String errorMessage,
      final Status status}) = _$ForumStateImpl;

  @override
  List<ForumModel> get results;
  @override
  String get errorMessage;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$ForumStateImplCopyWith<_$ForumStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
