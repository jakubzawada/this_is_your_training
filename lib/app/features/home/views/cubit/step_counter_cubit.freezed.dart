// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_counter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StepCounterState {
  int get steps => throw _privateConstructorUsedError;
  String get stepCount => throw _privateConstructorUsedError;
  String get caloriesBurned => throw _privateConstructorUsedError;
  String get distanceTraveled => throw _privateConstructorUsedError;
  int get goalSteps => throw _privateConstructorUsedError;
  bool get isPedometerActive => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepCounterStateCopyWith<StepCounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCounterStateCopyWith<$Res> {
  factory $StepCounterStateCopyWith(
          StepCounterState value, $Res Function(StepCounterState) then) =
      _$StepCounterStateCopyWithImpl<$Res, StepCounterState>;
  @useResult
  $Res call(
      {int steps,
      String stepCount,
      String caloriesBurned,
      String distanceTraveled,
      int goalSteps,
      bool isPedometerActive,
      String errorMessage});
}

/// @nodoc
class _$StepCounterStateCopyWithImpl<$Res, $Val extends StepCounterState>
    implements $StepCounterStateCopyWith<$Res> {
  _$StepCounterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? stepCount = null,
    Object? caloriesBurned = null,
    Object? distanceTraveled = null,
    Object? goalSteps = null,
    Object? isPedometerActive = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      stepCount: null == stepCount
          ? _value.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as String,
      caloriesBurned: null == caloriesBurned
          ? _value.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as String,
      distanceTraveled: null == distanceTraveled
          ? _value.distanceTraveled
          : distanceTraveled // ignore: cast_nullable_to_non_nullable
              as String,
      goalSteps: null == goalSteps
          ? _value.goalSteps
          : goalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      isPedometerActive: null == isPedometerActive
          ? _value.isPedometerActive
          : isPedometerActive // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepCounterStateImplCopyWith<$Res>
    implements $StepCounterStateCopyWith<$Res> {
  factory _$$StepCounterStateImplCopyWith(_$StepCounterStateImpl value,
          $Res Function(_$StepCounterStateImpl) then) =
      __$$StepCounterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int steps,
      String stepCount,
      String caloriesBurned,
      String distanceTraveled,
      int goalSteps,
      bool isPedometerActive,
      String errorMessage});
}

/// @nodoc
class __$$StepCounterStateImplCopyWithImpl<$Res>
    extends _$StepCounterStateCopyWithImpl<$Res, _$StepCounterStateImpl>
    implements _$$StepCounterStateImplCopyWith<$Res> {
  __$$StepCounterStateImplCopyWithImpl(_$StepCounterStateImpl _value,
      $Res Function(_$StepCounterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? stepCount = null,
    Object? caloriesBurned = null,
    Object? distanceTraveled = null,
    Object? goalSteps = null,
    Object? isPedometerActive = null,
    Object? errorMessage = null,
  }) {
    return _then(_$StepCounterStateImpl(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      stepCount: null == stepCount
          ? _value.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as String,
      caloriesBurned: null == caloriesBurned
          ? _value.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as String,
      distanceTraveled: null == distanceTraveled
          ? _value.distanceTraveled
          : distanceTraveled // ignore: cast_nullable_to_non_nullable
              as String,
      goalSteps: null == goalSteps
          ? _value.goalSteps
          : goalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      isPedometerActive: null == isPedometerActive
          ? _value.isPedometerActive
          : isPedometerActive // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StepCounterStateImpl implements _StepCounterState {
  _$StepCounterStateImpl(
      {this.steps = 0,
      this.stepCount = '0',
      this.caloriesBurned = '0',
      this.distanceTraveled = '0',
      this.goalSteps = 6000,
      this.isPedometerActive = true,
      this.errorMessage = ''});

  @override
  @JsonKey()
  final int steps;
  @override
  @JsonKey()
  final String stepCount;
  @override
  @JsonKey()
  final String caloriesBurned;
  @override
  @JsonKey()
  final String distanceTraveled;
  @override
  @JsonKey()
  final int goalSteps;
  @override
  @JsonKey()
  final bool isPedometerActive;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'StepCounterState(steps: $steps, stepCount: $stepCount, caloriesBurned: $caloriesBurned, distanceTraveled: $distanceTraveled, goalSteps: $goalSteps, isPedometerActive: $isPedometerActive, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepCounterStateImpl &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.stepCount, stepCount) ||
                other.stepCount == stepCount) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            (identical(other.distanceTraveled, distanceTraveled) ||
                other.distanceTraveled == distanceTraveled) &&
            (identical(other.goalSteps, goalSteps) ||
                other.goalSteps == goalSteps) &&
            (identical(other.isPedometerActive, isPedometerActive) ||
                other.isPedometerActive == isPedometerActive) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, steps, stepCount, caloriesBurned,
      distanceTraveled, goalSteps, isPedometerActive, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepCounterStateImplCopyWith<_$StepCounterStateImpl> get copyWith =>
      __$$StepCounterStateImplCopyWithImpl<_$StepCounterStateImpl>(
          this, _$identity);
}

abstract class _StepCounterState implements StepCounterState {
  factory _StepCounterState(
      {final int steps,
      final String stepCount,
      final String caloriesBurned,
      final String distanceTraveled,
      final int goalSteps,
      final bool isPedometerActive,
      final String errorMessage}) = _$StepCounterStateImpl;

  @override
  int get steps;
  @override
  String get stepCount;
  @override
  String get caloriesBurned;
  @override
  String get distanceTraveled;
  @override
  int get goalSteps;
  @override
  bool get isPedometerActive;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$StepCounterStateImplCopyWith<_$StepCounterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
