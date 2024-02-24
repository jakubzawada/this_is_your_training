// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monday_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MondayState {
  List<TrainingModel> get results => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MondayStateCopyWith<MondayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MondayStateCopyWith<$Res> {
  factory $MondayStateCopyWith(
          MondayState value, $Res Function(MondayState) then) =
      _$MondayStateCopyWithImpl<$Res, MondayState>;
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class _$MondayStateCopyWithImpl<$Res, $Val extends MondayState>
    implements $MondayStateCopyWith<$Res> {
  _$MondayStateCopyWithImpl(this._value, this._then);

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
abstract class _$$MondayStateImplCopyWith<$Res>
    implements $MondayStateCopyWith<$Res> {
  factory _$$MondayStateImplCopyWith(
          _$MondayStateImpl value, $Res Function(_$MondayStateImpl) then) =
      __$$MondayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class __$$MondayStateImplCopyWithImpl<$Res>
    extends _$MondayStateCopyWithImpl<$Res, _$MondayStateImpl>
    implements _$$MondayStateImplCopyWith<$Res> {
  __$$MondayStateImplCopyWithImpl(
      _$MondayStateImpl _value, $Res Function(_$MondayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$MondayStateImpl(
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

class _$MondayStateImpl implements _MondayState {
  _$MondayStateImpl(
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
    return 'MondayState(results: $results, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MondayStateImpl &&
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
  _$$MondayStateImplCopyWith<_$MondayStateImpl> get copyWith =>
      __$$MondayStateImplCopyWithImpl<_$MondayStateImpl>(this, _$identity);
}

abstract class _MondayState implements MondayState {
  factory _MondayState(
      {final List<TrainingModel> results,
      final Status status,
      final String errorMessage}) = _$MondayStateImpl;

  @override
  List<TrainingModel> get results;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MondayStateImplCopyWith<_$MondayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
