// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thursday_exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThursdayExerciseState {
  bool get saved => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get exerciseName3 => throw _privateConstructorUsedError;
  int? get series3 => throw _privateConstructorUsedError;
  int? get repeat3 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThursdayExerciseStateCopyWith<ThursdayExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThursdayExerciseStateCopyWith<$Res> {
  factory $ThursdayExerciseStateCopyWith(ThursdayExerciseState value,
          $Res Function(ThursdayExerciseState) then) =
      _$ThursdayExerciseStateCopyWithImpl<$Res, ThursdayExerciseState>;
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName3,
      int? series3,
      int? repeat3});
}

/// @nodoc
class _$ThursdayExerciseStateCopyWithImpl<$Res,
        $Val extends ThursdayExerciseState>
    implements $ThursdayExerciseStateCopyWith<$Res> {
  _$ThursdayExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName3 = null,
    Object? series3 = freezed,
    Object? repeat3 = freezed,
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
      exerciseName3: null == exerciseName3
          ? _value.exerciseName3
          : exerciseName3 // ignore: cast_nullable_to_non_nullable
              as String,
      series3: freezed == series3
          ? _value.series3
          : series3 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat3: freezed == repeat3
          ? _value.repeat3
          : repeat3 // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThursdayExerciseStateImplCopyWith<$Res>
    implements $ThursdayExerciseStateCopyWith<$Res> {
  factory _$$ThursdayExerciseStateImplCopyWith(
          _$ThursdayExerciseStateImpl value,
          $Res Function(_$ThursdayExerciseStateImpl) then) =
      __$$ThursdayExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName3,
      int? series3,
      int? repeat3});
}

/// @nodoc
class __$$ThursdayExerciseStateImplCopyWithImpl<$Res>
    extends _$ThursdayExerciseStateCopyWithImpl<$Res,
        _$ThursdayExerciseStateImpl>
    implements _$$ThursdayExerciseStateImplCopyWith<$Res> {
  __$$ThursdayExerciseStateImplCopyWithImpl(_$ThursdayExerciseStateImpl _value,
      $Res Function(_$ThursdayExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName3 = null,
    Object? series3 = freezed,
    Object? repeat3 = freezed,
  }) {
    return _then(_$ThursdayExerciseStateImpl(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName3: null == exerciseName3
          ? _value.exerciseName3
          : exerciseName3 // ignore: cast_nullable_to_non_nullable
              as String,
      series3: freezed == series3
          ? _value.series3
          : series3 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat3: freezed == repeat3
          ? _value.repeat3
          : repeat3 // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ThursdayExerciseStateImpl implements _ThursdayExerciseState {
  _$ThursdayExerciseStateImpl(
      {this.saved = false,
      this.errorMessage = '',
      this.exerciseName3 = '',
      this.series3,
      this.repeat3});

  @override
  @JsonKey()
  final bool saved;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String exerciseName3;
  @override
  final int? series3;
  @override
  final int? repeat3;

  @override
  String toString() {
    return 'ThursdayExerciseState(saved: $saved, errorMessage: $errorMessage, exerciseName3: $exerciseName3, series3: $series3, repeat3: $repeat3)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThursdayExerciseStateImpl &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.exerciseName3, exerciseName3) ||
                other.exerciseName3 == exerciseName3) &&
            (identical(other.series3, series3) || other.series3 == series3) &&
            (identical(other.repeat3, repeat3) || other.repeat3 == repeat3));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saved, errorMessage, exerciseName3, series3, repeat3);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThursdayExerciseStateImplCopyWith<_$ThursdayExerciseStateImpl>
      get copyWith => __$$ThursdayExerciseStateImplCopyWithImpl<
          _$ThursdayExerciseStateImpl>(this, _$identity);
}

abstract class _ThursdayExerciseState implements ThursdayExerciseState {
  factory _ThursdayExerciseState(
      {final bool saved,
      final String errorMessage,
      final String exerciseName3,
      final int? series3,
      final int? repeat3}) = _$ThursdayExerciseStateImpl;

  @override
  bool get saved;
  @override
  String get errorMessage;
  @override
  String get exerciseName3;
  @override
  int? get series3;
  @override
  int? get repeat3;
  @override
  @JsonKey(ignore: true)
  _$$ThursdayExerciseStateImplCopyWith<_$ThursdayExerciseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
