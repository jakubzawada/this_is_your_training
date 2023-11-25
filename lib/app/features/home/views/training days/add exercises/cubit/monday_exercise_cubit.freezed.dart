// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monday_exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MondayExerciseState {
  bool get saved => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  int? get series => throw _privateConstructorUsedError;
  int? get repeat => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MondayExerciseStateCopyWith<MondayExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MondayExerciseStateCopyWith<$Res> {
  factory $MondayExerciseStateCopyWith(
          MondayExerciseState value, $Res Function(MondayExerciseState) then) =
      _$MondayExerciseStateCopyWithImpl<$Res, MondayExerciseState>;
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName,
      int? series,
      int? repeat});
}

/// @nodoc
class _$MondayExerciseStateCopyWithImpl<$Res, $Val extends MondayExerciseState>
    implements $MondayExerciseStateCopyWith<$Res> {
  _$MondayExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName = null,
    Object? series = freezed,
    Object? repeat = freezed,
  }) {
    return _then(_value.copyWith(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MondayExerciseStateImplCopyWith<$Res>
    implements $MondayExerciseStateCopyWith<$Res> {
  factory _$$MondayExerciseStateImplCopyWith(_$MondayExerciseStateImpl value,
          $Res Function(_$MondayExerciseStateImpl) then) =
      __$$MondayExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName,
      int? series,
      int? repeat});
}

/// @nodoc
class __$$MondayExerciseStateImplCopyWithImpl<$Res>
    extends _$MondayExerciseStateCopyWithImpl<$Res, _$MondayExerciseStateImpl>
    implements _$$MondayExerciseStateImplCopyWith<$Res> {
  __$$MondayExerciseStateImplCopyWithImpl(_$MondayExerciseStateImpl _value,
      $Res Function(_$MondayExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName = null,
    Object? series = freezed,
    Object? repeat = freezed,
  }) {
    return _then(_$MondayExerciseStateImpl(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$MondayExerciseStateImpl implements _MondayExerciseState {
  _$MondayExerciseStateImpl(
      {this.saved = false,
      this.errorMessage = '',
      this.exerciseName = '',
      this.series,
      this.repeat});

  @override
  @JsonKey()
  final bool saved;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String exerciseName;
  @override
  final int? series;
  @override
  final int? repeat;

  @override
  String toString() {
    return 'MondayExerciseState(saved: $saved, errorMessage: $errorMessage, exerciseName: $exerciseName, series: $series, repeat: $repeat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MondayExerciseStateImpl &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.repeat, repeat) || other.repeat == repeat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saved, errorMessage, exerciseName, series, repeat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MondayExerciseStateImplCopyWith<_$MondayExerciseStateImpl> get copyWith =>
      __$$MondayExerciseStateImplCopyWithImpl<_$MondayExerciseStateImpl>(
          this, _$identity);
}

abstract class _MondayExerciseState implements MondayExerciseState {
  factory _MondayExerciseState(
      {final bool saved,
      final String errorMessage,
      final String exerciseName,
      final int? series,
      final int? repeat}) = _$MondayExerciseStateImpl;

  @override
  bool get saved;
  @override
  String get errorMessage;
  @override
  String get exerciseName;
  @override
  int? get series;
  @override
  int? get repeat;
  @override
  @JsonKey(ignore: true)
  _$$MondayExerciseStateImplCopyWith<_$MondayExerciseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
