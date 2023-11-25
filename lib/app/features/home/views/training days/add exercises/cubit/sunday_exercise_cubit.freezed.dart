// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sunday_exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SundayExerciseState {
  bool get saved => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get exerciseName6 => throw _privateConstructorUsedError;
  int? get series6 => throw _privateConstructorUsedError;
  int? get repeat6 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SundayExerciseStateCopyWith<SundayExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SundayExerciseStateCopyWith<$Res> {
  factory $SundayExerciseStateCopyWith(
          SundayExerciseState value, $Res Function(SundayExerciseState) then) =
      _$SundayExerciseStateCopyWithImpl<$Res, SundayExerciseState>;
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName6,
      int? series6,
      int? repeat6});
}

/// @nodoc
class _$SundayExerciseStateCopyWithImpl<$Res, $Val extends SundayExerciseState>
    implements $SundayExerciseStateCopyWith<$Res> {
  _$SundayExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName6 = null,
    Object? series6 = freezed,
    Object? repeat6 = freezed,
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
      exerciseName6: null == exerciseName6
          ? _value.exerciseName6
          : exerciseName6 // ignore: cast_nullable_to_non_nullable
              as String,
      series6: freezed == series6
          ? _value.series6
          : series6 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat6: freezed == repeat6
          ? _value.repeat6
          : repeat6 // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SundayExerciseStateImplCopyWith<$Res>
    implements $SundayExerciseStateCopyWith<$Res> {
  factory _$$SundayExerciseStateImplCopyWith(_$SundayExerciseStateImpl value,
          $Res Function(_$SundayExerciseStateImpl) then) =
      __$$SundayExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName6,
      int? series6,
      int? repeat6});
}

/// @nodoc
class __$$SundayExerciseStateImplCopyWithImpl<$Res>
    extends _$SundayExerciseStateCopyWithImpl<$Res, _$SundayExerciseStateImpl>
    implements _$$SundayExerciseStateImplCopyWith<$Res> {
  __$$SundayExerciseStateImplCopyWithImpl(_$SundayExerciseStateImpl _value,
      $Res Function(_$SundayExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName6 = null,
    Object? series6 = freezed,
    Object? repeat6 = freezed,
  }) {
    return _then(_$SundayExerciseStateImpl(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName6: null == exerciseName6
          ? _value.exerciseName6
          : exerciseName6 // ignore: cast_nullable_to_non_nullable
              as String,
      series6: freezed == series6
          ? _value.series6
          : series6 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat6: freezed == repeat6
          ? _value.repeat6
          : repeat6 // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SundayExerciseStateImpl implements _SundayExerciseState {
  _$SundayExerciseStateImpl(
      {this.saved = false,
      this.errorMessage = '',
      this.exerciseName6 = '',
      this.series6,
      this.repeat6});

  @override
  @JsonKey()
  final bool saved;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String exerciseName6;
  @override
  final int? series6;
  @override
  final int? repeat6;

  @override
  String toString() {
    return 'SundayExerciseState(saved: $saved, errorMessage: $errorMessage, exerciseName6: $exerciseName6, series6: $series6, repeat6: $repeat6)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SundayExerciseStateImpl &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.exerciseName6, exerciseName6) ||
                other.exerciseName6 == exerciseName6) &&
            (identical(other.series6, series6) || other.series6 == series6) &&
            (identical(other.repeat6, repeat6) || other.repeat6 == repeat6));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saved, errorMessage, exerciseName6, series6, repeat6);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SundayExerciseStateImplCopyWith<_$SundayExerciseStateImpl> get copyWith =>
      __$$SundayExerciseStateImplCopyWithImpl<_$SundayExerciseStateImpl>(
          this, _$identity);
}

abstract class _SundayExerciseState implements SundayExerciseState {
  factory _SundayExerciseState(
      {final bool saved,
      final String errorMessage,
      final String exerciseName6,
      final int? series6,
      final int? repeat6}) = _$SundayExerciseStateImpl;

  @override
  bool get saved;
  @override
  String get errorMessage;
  @override
  String get exerciseName6;
  @override
  int? get series6;
  @override
  int? get repeat6;
  @override
  @JsonKey(ignore: true)
  _$$SundayExerciseStateImplCopyWith<_$SundayExerciseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
