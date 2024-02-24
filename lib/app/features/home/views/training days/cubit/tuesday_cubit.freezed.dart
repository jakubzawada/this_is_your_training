// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tuesday_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TuesdayState {
  List<TrainingModel> get results => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TuesdayStateCopyWith<TuesdayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TuesdayStateCopyWith<$Res> {
  factory $TuesdayStateCopyWith(
          TuesdayState value, $Res Function(TuesdayState) then) =
      _$TuesdayStateCopyWithImpl<$Res, TuesdayState>;
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class _$TuesdayStateCopyWithImpl<$Res, $Val extends TuesdayState>
    implements $TuesdayStateCopyWith<$Res> {
  _$TuesdayStateCopyWithImpl(this._value, this._then);

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
abstract class _$$TuesdayStateImplCopyWith<$Res>
    implements $TuesdayStateCopyWith<$Res> {
  factory _$$TuesdayStateImplCopyWith(
          _$TuesdayStateImpl value, $Res Function(_$TuesdayStateImpl) then) =
      __$$TuesdayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class __$$TuesdayStateImplCopyWithImpl<$Res>
    extends _$TuesdayStateCopyWithImpl<$Res, _$TuesdayStateImpl>
    implements _$$TuesdayStateImplCopyWith<$Res> {
  __$$TuesdayStateImplCopyWithImpl(
      _$TuesdayStateImpl _value, $Res Function(_$TuesdayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$TuesdayStateImpl(
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

class _$TuesdayStateImpl implements _TuesdayState {
  _$TuesdayStateImpl(
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
    return 'TuesdayState(results: $results, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TuesdayStateImpl &&
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
  _$$TuesdayStateImplCopyWith<_$TuesdayStateImpl> get copyWith =>
      __$$TuesdayStateImplCopyWithImpl<_$TuesdayStateImpl>(this, _$identity);
}

abstract class _TuesdayState implements TuesdayState {
  factory _TuesdayState(
      {final List<TrainingModel> results,
      final Status status,
      final String errorMessage}) = _$TuesdayStateImpl;

  @override
  List<TrainingModel> get results;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$TuesdayStateImplCopyWith<_$TuesdayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
