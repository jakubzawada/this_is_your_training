// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saturday_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SaturdayState {
  List<TrainingModel> get results => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaturdayStateCopyWith<SaturdayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaturdayStateCopyWith<$Res> {
  factory $SaturdayStateCopyWith(
          SaturdayState value, $Res Function(SaturdayState) then) =
      _$SaturdayStateCopyWithImpl<$Res, SaturdayState>;
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class _$SaturdayStateCopyWithImpl<$Res, $Val extends SaturdayState>
    implements $SaturdayStateCopyWith<$Res> {
  _$SaturdayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TrainingModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaturdayStateCopyWith<$Res>
    implements $SaturdayStateCopyWith<$Res> {
  factory _$$_SaturdayStateCopyWith(
          _$_SaturdayState value, $Res Function(_$_SaturdayState) then) =
      __$$_SaturdayStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class __$$_SaturdayStateCopyWithImpl<$Res>
    extends _$SaturdayStateCopyWithImpl<$Res, _$_SaturdayState>
    implements _$$_SaturdayStateCopyWith<$Res> {
  __$$_SaturdayStateCopyWithImpl(
      _$_SaturdayState _value, $Res Function(_$_SaturdayState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_SaturdayState(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TrainingModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SaturdayState implements _SaturdayState {
  _$_SaturdayState(
      {final List<TrainingModel> results = const [],
      this.status = Status.loading,
      this.errorMessage = ''})
      : _results = results;

  final List<TrainingModel> _results;
  @override
  @JsonKey()
  List<TrainingModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'SaturdayState(results: $results, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaturdayState &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_results), status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaturdayStateCopyWith<_$_SaturdayState> get copyWith =>
      __$$_SaturdayStateCopyWithImpl<_$_SaturdayState>(this, _$identity);
}

abstract class _SaturdayState implements SaturdayState {
  factory _SaturdayState(
      {final List<TrainingModel> results,
      final Status status,
      final String errorMessage}) = _$_SaturdayState;

  @override
  List<TrainingModel> get results;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SaturdayStateCopyWith<_$_SaturdayState> get copyWith =>
      throw _privateConstructorUsedError;
}
