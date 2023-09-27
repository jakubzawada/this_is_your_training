// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sunday_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SundayState {
  List<TrainingModel> get documents => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SundayStateCopyWith<SundayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SundayStateCopyWith<$Res> {
  factory $SundayStateCopyWith(
          SundayState value, $Res Function(SundayState) then) =
      _$SundayStateCopyWithImpl<$Res, SundayState>;
  @useResult
  $Res call(
      {List<TrainingModel> documents, bool isLoading, String errorMessage});
}

/// @nodoc
class _$SundayStateCopyWithImpl<$Res, $Val extends SundayState>
    implements $SundayStateCopyWith<$Res> {
  _$SundayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<TrainingModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SundayStateCopyWith<$Res>
    implements $SundayStateCopyWith<$Res> {
  factory _$$_SundayStateCopyWith(
          _$_SundayState value, $Res Function(_$_SundayState) then) =
      __$$_SundayStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TrainingModel> documents, bool isLoading, String errorMessage});
}

/// @nodoc
class __$$_SundayStateCopyWithImpl<$Res>
    extends _$SundayStateCopyWithImpl<$Res, _$_SundayState>
    implements _$$_SundayStateCopyWith<$Res> {
  __$$_SundayStateCopyWithImpl(
      _$_SundayState _value, $Res Function(_$_SundayState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_SundayState(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<TrainingModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SundayState implements _SundayState {
  _$_SundayState(
      {final List<TrainingModel> documents = const [],
      this.isLoading = false,
      this.errorMessage = ''})
      : _documents = documents;

  final List<TrainingModel> _documents;
  @override
  @JsonKey()
  List<TrainingModel> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'SundayState(documents: $documents, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SundayState &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_documents), isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SundayStateCopyWith<_$_SundayState> get copyWith =>
      __$$_SundayStateCopyWithImpl<_$_SundayState>(this, _$identity);
}

abstract class _SundayState implements SundayState {
  factory _SundayState(
      {final List<TrainingModel> documents,
      final bool isLoading,
      final String errorMessage}) = _$_SundayState;

  @override
  List<TrainingModel> get documents;
  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SundayStateCopyWith<_$_SundayState> get copyWith =>
      throw _privateConstructorUsedError;
}
