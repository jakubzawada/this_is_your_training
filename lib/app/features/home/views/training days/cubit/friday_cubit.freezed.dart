// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friday_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FridayState {
  List<TrainingModel> get results => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FridayStateCopyWith<FridayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridayStateCopyWith<$Res> {
  factory $FridayStateCopyWith(
          FridayState value, $Res Function(FridayState) then) =
      _$FridayStateCopyWithImpl<$Res, FridayState>;
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class _$FridayStateCopyWithImpl<$Res, $Val extends FridayState>
    implements $FridayStateCopyWith<$Res> {
  _$FridayStateCopyWithImpl(this._value, this._then);

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
abstract class _$$FridayStateImplCopyWith<$Res>
    implements $FridayStateCopyWith<$Res> {
  factory _$$FridayStateImplCopyWith(
          _$FridayStateImpl value, $Res Function(_$FridayStateImpl) then) =
      __$$FridayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TrainingModel> results, Status status, String errorMessage});
}

/// @nodoc
class __$$FridayStateImplCopyWithImpl<$Res>
    extends _$FridayStateCopyWithImpl<$Res, _$FridayStateImpl>
    implements _$$FridayStateImplCopyWith<$Res> {
  __$$FridayStateImplCopyWithImpl(
      _$FridayStateImpl _value, $Res Function(_$FridayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$FridayStateImpl(
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

class _$FridayStateImpl implements _FridayState {
  _$FridayStateImpl(
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
    return 'FridayState(results: $results, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FridayStateImpl &&
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
  _$$FridayStateImplCopyWith<_$FridayStateImpl> get copyWith =>
      __$$FridayStateImplCopyWithImpl<_$FridayStateImpl>(this, _$identity);
}

abstract class _FridayState implements FridayState {
  factory _FridayState(
      {final List<TrainingModel> results,
      final Status status,
      final String errorMessage}) = _$FridayStateImpl;

  @override
  List<TrainingModel> get results;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$FridayStateImplCopyWith<_$FridayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
