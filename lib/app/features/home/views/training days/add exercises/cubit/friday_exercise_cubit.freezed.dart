// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friday_exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FridayExerciseState {
  bool get saved => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get exerciseName4 => throw _privateConstructorUsedError;
  int? get series4 => throw _privateConstructorUsedError;
  int? get repeat4 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FridayExerciseStateCopyWith<FridayExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridayExerciseStateCopyWith<$Res> {
  factory $FridayExerciseStateCopyWith(
          FridayExerciseState value, $Res Function(FridayExerciseState) then) =
      _$FridayExerciseStateCopyWithImpl<$Res, FridayExerciseState>;
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName4,
      int? series4,
      int? repeat4});
}

/// @nodoc
class _$FridayExerciseStateCopyWithImpl<$Res, $Val extends FridayExerciseState>
    implements $FridayExerciseStateCopyWith<$Res> {
  _$FridayExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName4 = null,
    Object? series4 = freezed,
    Object? repeat4 = freezed,
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
      exerciseName4: null == exerciseName4
          ? _value.exerciseName4
          : exerciseName4 // ignore: cast_nullable_to_non_nullable
              as String,
      series4: freezed == series4
          ? _value.series4
          : series4 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat4: freezed == repeat4
          ? _value.repeat4
          : repeat4 // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FridayExerciseStateImplCopyWith<$Res>
    implements $FridayExerciseStateCopyWith<$Res> {
  factory _$$FridayExerciseStateImplCopyWith(_$FridayExerciseStateImpl value,
          $Res Function(_$FridayExerciseStateImpl) then) =
      __$$FridayExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool saved,
      String errorMessage,
      String exerciseName4,
      int? series4,
      int? repeat4});
}

/// @nodoc
class __$$FridayExerciseStateImplCopyWithImpl<$Res>
    extends _$FridayExerciseStateCopyWithImpl<$Res, _$FridayExerciseStateImpl>
    implements _$$FridayExerciseStateImplCopyWith<$Res> {
  __$$FridayExerciseStateImplCopyWithImpl(_$FridayExerciseStateImpl _value,
      $Res Function(_$FridayExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = null,
    Object? exerciseName4 = null,
    Object? series4 = freezed,
    Object? repeat4 = freezed,
  }) {
    return _then(_$FridayExerciseStateImpl(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName4: null == exerciseName4
          ? _value.exerciseName4
          : exerciseName4 // ignore: cast_nullable_to_non_nullable
              as String,
      series4: freezed == series4
          ? _value.series4
          : series4 // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat4: freezed == repeat4
          ? _value.repeat4
          : repeat4 // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FridayExerciseStateImpl implements _FridayExerciseState {
  _$FridayExerciseStateImpl(
      {this.saved = false,
      this.errorMessage = '',
      this.exerciseName4 = '',
      this.series4,
      this.repeat4});

  @override
  @JsonKey()
  final bool saved;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final String exerciseName4;
  @override
  final int? series4;
  @override
  final int? repeat4;

  @override
  String toString() {
    return 'FridayExerciseState(saved: $saved, errorMessage: $errorMessage, exerciseName4: $exerciseName4, series4: $series4, repeat4: $repeat4)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FridayExerciseStateImpl &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.exerciseName4, exerciseName4) ||
                other.exerciseName4 == exerciseName4) &&
            (identical(other.series4, series4) || other.series4 == series4) &&
            (identical(other.repeat4, repeat4) || other.repeat4 == repeat4));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saved, errorMessage, exerciseName4, series4, repeat4);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FridayExerciseStateImplCopyWith<_$FridayExerciseStateImpl> get copyWith =>
      __$$FridayExerciseStateImplCopyWithImpl<_$FridayExerciseStateImpl>(
          this, _$identity);
}

abstract class _FridayExerciseState implements FridayExerciseState {
  factory _FridayExerciseState(
      {final bool saved,
      final String errorMessage,
      final String exerciseName4,
      final int? series4,
      final int? repeat4}) = _$FridayExerciseStateImpl;

  @override
  bool get saved;
  @override
  String get errorMessage;
  @override
  String get exerciseName4;
  @override
  int? get series4;
  @override
  int? get repeat4;
  @override
  @JsonKey(ignore: true)
  _$$FridayExerciseStateImplCopyWith<_$FridayExerciseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
