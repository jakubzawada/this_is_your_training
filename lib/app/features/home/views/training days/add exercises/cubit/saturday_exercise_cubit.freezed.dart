// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saturday_exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaturdayExerciseState {
  bool get saved => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get exerciseName5 => throw _privateConstructorUsedError;
  int? get series5 => throw _privateConstructorUsedError;
  int? get repeat5 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaturdayExerciseStateCopyWith<SaturdayExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaturdayExerciseStateCopyWith<$Res> {
  factory $SaturdayExerciseStateCopyWith(SaturdayExerciseState value,
          $Res Function(SaturdayExerciseState) then) =
      _$SaturdayExerciseStateCopyWithImpl<$Res, SaturdayExerciseState>;
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName5,
      int? series5,
      int? repeat5});
}

/// @nodoc
class _$SaturdayExerciseStateCopyWithImpl<$Res,
        $Val extends SaturdayExerciseState>
    implements $SaturdayExerciseStateCopyWith<$Res> {
  _$SaturdayExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName5 = null,
    Object? series5 = freezed,
    Object? repeat5 = freezed,
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
      exerciseName5: null == exerciseName5
          ? _value.exerciseName5
          : exerciseName5 // ignore: cast_nullable_to_non_nullable
              as String,
      series5: freezed == series5
          ? _value.series5
          : series5 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat5: freezed == repeat5
          ? _value.repeat5
          : repeat5 // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaturdayExerciseStateImplCopyWith<$Res>
    implements $SaturdayExerciseStateCopyWith<$Res> {
  factory _$$SaturdayExerciseStateImplCopyWith(
          _$SaturdayExerciseStateImpl value,
          $Res Function(_$SaturdayExerciseStateImpl) then) =
      __$$SaturdayExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName5,
      int? series5,
      int? repeat5});
}

/// @nodoc
class __$$SaturdayExerciseStateImplCopyWithImpl<$Res>
    extends _$SaturdayExerciseStateCopyWithImpl<$Res,
        _$SaturdayExerciseStateImpl>
    implements _$$SaturdayExerciseStateImplCopyWith<$Res> {
  __$$SaturdayExerciseStateImplCopyWithImpl(_$SaturdayExerciseStateImpl _value,
      $Res Function(_$SaturdayExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName5 = null,
    Object? series5 = freezed,
    Object? repeat5 = freezed,
  }) {
    return _then(_$SaturdayExerciseStateImpl(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName5: null == exerciseName5
          ? _value.exerciseName5
          : exerciseName5 // ignore: cast_nullable_to_non_nullable
              as String,
      series5: freezed == series5
          ? _value.series5
          : series5 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat5: freezed == repeat5
          ? _value.repeat5
          : repeat5 // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SaturdayExerciseStateImpl implements _SaturdayExerciseState {
  _$SaturdayExerciseStateImpl(
      {this.saved = false,
      this.errorMessage = '',
      this.exerciseName5 = '',
      this.series5,
      this.repeat5});

  @override
  @JsonKey()
  final bool saved;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String exerciseName5;
  @override
  final int? series5;
  @override
  final int? repeat5;

  @override
  String toString() {
    return 'SaturdayExerciseState(saved: $saved, errorMessage: $errorMessage, exerciseName5: $exerciseName5, series5: $series5, repeat5: $repeat5)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaturdayExerciseStateImpl &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.exerciseName5, exerciseName5) ||
                other.exerciseName5 == exerciseName5) &&
            (identical(other.series5, series5) || other.series5 == series5) &&
            (identical(other.repeat5, repeat5) || other.repeat5 == repeat5));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saved, errorMessage, exerciseName5, series5, repeat5);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaturdayExerciseStateImplCopyWith<_$SaturdayExerciseStateImpl>
      get copyWith => __$$SaturdayExerciseStateImplCopyWithImpl<
          _$SaturdayExerciseStateImpl>(this, _$identity);
}

abstract class _SaturdayExerciseState implements SaturdayExerciseState {
  factory _SaturdayExerciseState(
      {final bool saved,
      final String errorMessage,
      final String exerciseName5,
      final int? series5,
      final int? repeat5}) = _$SaturdayExerciseStateImpl;

  @override
  bool get saved;
  @override
  String get errorMessage;
  @override
  String get exerciseName5;
  @override
  int? get series5;
  @override
  int? get repeat5;
  @override
  @JsonKey(ignore: true)
  _$$SaturdayExerciseStateImplCopyWith<_$SaturdayExerciseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
