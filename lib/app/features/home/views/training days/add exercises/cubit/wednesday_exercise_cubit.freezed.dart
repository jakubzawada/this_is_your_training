// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wednesday_exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WednesdayExerciseState {
  bool get saved => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get exerciseName2 => throw _privateConstructorUsedError;
  int? get series2 => throw _privateConstructorUsedError;
  int? get repeat2 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WednesdayExerciseStateCopyWith<WednesdayExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WednesdayExerciseStateCopyWith<$Res> {
  factory $WednesdayExerciseStateCopyWith(WednesdayExerciseState value,
          $Res Function(WednesdayExerciseState) then) =
      _$WednesdayExerciseStateCopyWithImpl<$Res, WednesdayExerciseState>;
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName2,
      int? series2,
      int? repeat2});
}

/// @nodoc
class _$WednesdayExerciseStateCopyWithImpl<$Res,
        $Val extends WednesdayExerciseState>
    implements $WednesdayExerciseStateCopyWith<$Res> {
  _$WednesdayExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName2 = null,
    Object? series2 = freezed,
    Object? repeat2 = freezed,
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
      exerciseName2: null == exerciseName2
          ? _value.exerciseName2
          : exerciseName2 // ignore: cast_nullable_to_non_nullable
              as String,
      series2: freezed == series2
          ? _value.series2
          : series2 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat2: freezed == repeat2
          ? _value.repeat2
          : repeat2 // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WednesdayExerciseStateImplCopyWith<$Res>
    implements $WednesdayExerciseStateCopyWith<$Res> {
  factory _$$WednesdayExerciseStateImplCopyWith(
          _$WednesdayExerciseStateImpl value,
          $Res Function(_$WednesdayExerciseStateImpl) then) =
      __$$WednesdayExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName2,
      int? series2,
      int? repeat2});
}

/// @nodoc
class __$$WednesdayExerciseStateImplCopyWithImpl<$Res>
    extends _$WednesdayExerciseStateCopyWithImpl<$Res,
        _$WednesdayExerciseStateImpl>
    implements _$$WednesdayExerciseStateImplCopyWith<$Res> {
  __$$WednesdayExerciseStateImplCopyWithImpl(
      _$WednesdayExerciseStateImpl _value,
      $Res Function(_$WednesdayExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName2 = null,
    Object? series2 = freezed,
    Object? repeat2 = freezed,
  }) {
    return _then(_$WednesdayExerciseStateImpl(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName2: null == exerciseName2
          ? _value.exerciseName2
          : exerciseName2 // ignore: cast_nullable_to_non_nullable
              as String,
      series2: freezed == series2
          ? _value.series2
          : series2 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat2: freezed == repeat2
          ? _value.repeat2
          : repeat2 // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$WednesdayExerciseStateImpl implements _WednesdayExerciseState {
  _$WednesdayExerciseStateImpl(
      {this.saved = false,
      this.errorMessage = '',
      this.exerciseName2 = '',
      this.series2,
      this.repeat2});

  @override
  @JsonKey()
  final bool saved;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String exerciseName2;
  @override
  final int? series2;
  @override
  final int? repeat2;

  @override
  String toString() {
    return 'WednesdayExerciseState(saved: $saved, errorMessage: $errorMessage, exerciseName2: $exerciseName2, series2: $series2, repeat2: $repeat2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WednesdayExerciseStateImpl &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.exerciseName2, exerciseName2) ||
                other.exerciseName2 == exerciseName2) &&
            (identical(other.series2, series2) || other.series2 == series2) &&
            (identical(other.repeat2, repeat2) || other.repeat2 == repeat2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saved, errorMessage, exerciseName2, series2, repeat2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WednesdayExerciseStateImplCopyWith<_$WednesdayExerciseStateImpl>
      get copyWith => __$$WednesdayExerciseStateImplCopyWithImpl<
          _$WednesdayExerciseStateImpl>(this, _$identity);
}

abstract class _WednesdayExerciseState implements WednesdayExerciseState {
  factory _WednesdayExerciseState(
      {final bool saved,
      final String errorMessage,
      final String exerciseName2,
      final int? series2,
      final int? repeat2}) = _$WednesdayExerciseStateImpl;

  @override
  bool get saved;
  @override
  String get errorMessage;
  @override
  String get exerciseName2;
  @override
  int? get series2;
  @override
  int? get repeat2;
  @override
  @JsonKey(ignore: true)
  _$$WednesdayExerciseStateImplCopyWith<_$WednesdayExerciseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
