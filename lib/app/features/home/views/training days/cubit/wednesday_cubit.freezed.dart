// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wednesday_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WednesdayState {
  List<TrainingModel> get results => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WednesdayStateCopyWith<WednesdayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WednesdayStateCopyWith<$Res> {
  factory $WednesdayStateCopyWith(
          WednesdayState value, $Res Function(WednesdayState) then) =
      _$WednesdayStateCopyWithImpl<$Res, WednesdayState>;
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class _$WednesdayStateCopyWithImpl<$Res, $Val extends WednesdayState>
    implements $WednesdayStateCopyWith<$Res> {
  _$WednesdayStateCopyWithImpl(this._value, this._then);

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
abstract class _$$WednesdayStateImplCopyWith<$Res>
    implements $WednesdayStateCopyWith<$Res> {
  factory _$$WednesdayStateImplCopyWith(_$WednesdayStateImpl value,
          $Res Function(_$WednesdayStateImpl) then) =
      __$$WednesdayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class __$$WednesdayStateImplCopyWithImpl<$Res>
    extends _$WednesdayStateCopyWithImpl<$Res, _$WednesdayStateImpl>
    implements _$$WednesdayStateImplCopyWith<$Res> {
  __$$WednesdayStateImplCopyWithImpl(
      _$WednesdayStateImpl _value, $Res Function(_$WednesdayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$WednesdayStateImpl(
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

class _$WednesdayStateImpl implements _WednesdayState {
  _$WednesdayStateImpl(
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
    return 'WednesdayState(results: $results, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WednesdayStateImpl &&
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
  _$$WednesdayStateImplCopyWith<_$WednesdayStateImpl> get copyWith =>
      __$$WednesdayStateImplCopyWithImpl<_$WednesdayStateImpl>(
          this, _$identity);
}

abstract class _WednesdayState implements WednesdayState {
  factory _WednesdayState(
      {final List<TrainingModel> results,
      final Status status,
      final String errorMessage}) = _$WednesdayStateImpl;

  @override
  List<TrainingModel> get results;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$WednesdayStateImplCopyWith<_$WednesdayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
